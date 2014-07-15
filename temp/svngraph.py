#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
	@brief	svnのリポジトリ構造を解析してGraphvisに渡す
	@author Yamauchi_Shoji
	@date   2014/07/14
"""

import os, os.path, sys, re, time
import json,codecs
import subprocess

from pprint import pprint
import logging
LOG_FILENAME = 'svngraph.log'
logging.basicConfig(filename=LOG_FILENAME,level=logging.DEBUG)

	

def __usage():
	print("usage:")
	print("svngraph.py [repositoryURL : default=root]")

def run_cmd(cmd):
	print(cmd)
	p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	stdout_data, stderr_data = p.communicate()
	return p.returncode, stdout_data, stderr_data
# ==============================================================================
# 	main
# ==============================================================================
def main():

	global EXPORT_LINK_LEVEL

	# 使い方表示
	if len(sys.argv) < 1 or len(sys.argv) > 2:
		__usage()
		sys.exit(0)
		
	start_time = time.clock()

	patt_url = re.compile("((https?|ftp|file)://[A-Za-z0-9\'~+\-=_.,/%\?!;:@#\*&\(\)]+)")	
	# URL取得
	m = patt_url.search(run_cmd(['svn','info'])[1].split("\r\n")[2])
	if m:
		svnroot = m.group(0)
		print(svnroot)
		svnpropinfodump = run_cmd(['svn','proplist',svnroot,'-R',"-v"])[1].replace("\r","").split("Properties on")
		#pprint(svnpropinfodump)
		
		
		# propリスト
		propinfolist = []
		
		# 整形
		for line in svnpropinfodump:
			if line.find("svn:mergeinfo") > 0 or line.find("svn:externals") >0:
				
				propinfo = {}
				props = line.replace("  ","\t").replace("\n\t\t"," ").split("\n")
				patt_url = re.compile("'((https?|ftp|file)://[A-Za-z0-9\'~+\-=_.,/%\?!;:@#\*&\(\)]+)'")
				m = patt_url.search(props[0])
				
				pprint(props)
				
				if m:
					propinfo['URL'] = m.group(0)
				
				for p in props:
					
					# スペースで区切って先頭(svn:???)を削除
					p = p.split(" ")
					propstring = p[0]
					del p[0]
					
					# propごとに仕訳
					if propstring.find("svn:externals")>0:
						
						ext ={}
						
						if p[0] == "-r":
							del p[0] # -rは不要なので消しとく
							del p[0] # リビジョン番号も不要(アドレスに付加されてる)
						
						ext[p[1]] = p[0] # p[1]がフォルダ名 p[0] がアドレス	
						propinfo['ext'] = ext
					elif propstring.find("svn:mergeinfo")>0:
						propinfo['merge'] = p
				
				propinfolist.append(propinfo)
				
		#pprint(propinfolist)

		#f = codecs.open('prop.json','w','utf-8')
		f = open("prop.json","w")
		json.dump(propinfolist, f, sort_keys=True, indent=4,ensure_ascii=False)
		
		#for line in propinfolist: 
		#	f.write(str(line) + "\n")

	end_time = time.clock()
	print("complete![time: ",(end_time - start_time),"sec]")
		
# __main__
if __name__ == '__main__':
	#psyco.full()
	main()

