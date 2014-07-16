" vi 互換ではなくVim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化
filetype off





"================================
" neobundleでプラグインを管理
"================================
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
nnoremap <Leader>e :VimFilerExplorer<CR>
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
"mru,reg,buf
noremap :um :Unite file_mru -buffer-name=file_mru
noremap :ur :Unite register -buffer-name=register
noremap :ub :Unite buffer -buffer-name=buffer
nnoremap <C-u>m  :Unite file_mru<CR>


" エディタリスタート
NeoBundle 'tyru/restart.vim'
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'


NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-endwise.git' 
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
"NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thinca/vim-ref'
"NeoBundle 'taichouchou2/vim-ref-ri'
"NeoBundle 'taq/vim-rspec'
NeoBundle 'itchyny/lightline.vim'
" Perl関連プラグインをバンドル
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'

" poweshell
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'cd01/poshcomplete-vim'


NeoBundle 'osyo-manga/vim-over'


" 実行プラグインをバンドル
NeoBundle 'thinca/vim-quickrun'
" 編集履歴管理
NeoBundleLazy "sjl/gundo.vim", {
      \ "autoload": {
      \   "commands": ['GundoToggle'],
      \}}
nnoremap <Leader>g :GundoToggle<CR>

"ツールバーを今風に
NeoBundle 'istepura/vim-toolbar-icons-silk'
"インデントカラーリング
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'nielsadb/vim-filtering'
NeoBundle 'Sixeight/unite-grep'

"ヤンクの履歴を管理
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'


NeoBundle 'glidenote/memolist.vim'
NeoBundle 'L9'
NeoBundle 'vim-scripts/FuzzyFinder'

"Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" インテリセンス関連
"NeoBundleLazy 'Shougo/neosnippet.vim', {
"    \ "autoload": {"insert": 1}}
NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ "autoload": {"insert": 1}}


" C/C++
NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }

NeoBundleLazy 'Rip-Rip/clang_complete', {
    \ 'autoload' : {
    \ 'filetypes' : ['c', 'cpp'],
    \ },
    \ }

"NeoBundle 'Shougo/neocomplcache.vim'
" Install clang_complete
"NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'

"ウィンドウ位置保存
NeoBundle 'osyo-manga/vim-reanimate'

" ハイライト
NeoBundle 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)


NeoBundle 'scrooloose/nerdtree'
 
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2
let g:NERDTreeShowBookmarks=1


"構文エラー表示
NeoBundle "scrooloose/syntastic", {
      \ "build": {
      \   "mac": ["pip install flake8", "npm -g install coffeelint"],
      \   "unix": ["pip install flake8", "npm -g install coffeelint"],
      \ }}


"=====================================
"python向け補完・リファクタリング
"=====================================
"
"" Djangoを正しくVimで読み込めるようにする
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
" Vimで正しくvirtualenvを処理できるようにする
NeoBundleLazy "jmcantrell/vim-virtualenv", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}

" 補完・リファクタリング
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
     \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  let g:jedi#rename_command = '<Space>r'
  let g:jedi#goto_assignments_command = '<Space>g'
endfunction



" インストールされていないプラグインのチェックおよびダウンロード
NeoBundleCheck


set t_Co=256


"================================
" vimrcが保存されたら勝手に再起動
"================================
"augroup MyAutoCmd
"    autocmd!
"augroup END

"if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
"    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
"else
    " .vimrcの再読込時にも色が変化するようにする
"    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
"                \if has('gui_running') | source $MYGVIMRC  
"    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
"endif

" auto reload .vimrc
"augroup source-vimrc
"  autocmd!
"  autocmd BufWritePost *vimrc :bufdo source $MYVIMRC | set foldmethod=marker
"  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
"augroup END



"--------------------------------------------------
" エディタ設定
"--------------------------------------------------
" シンタックスハイライト
syntax on
" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ビープ音を消す
set vb t_vb=
set novisualbell
" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
" 不可視文字を表示
set list
" 行番号を表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set nowrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 80文字目にラインを入れる
set colorcolumn=80
" 不可視文字を表示
set listchars=tab:~\ ,trail:_,extends:»,precedes:«,nbsp:%,eol:↲
" タブとか改行を示す文字列 eol(改行)は背景色違いのスペースにする。
"set listchars=eol:$,tab:~\ ,trail:_,extends:\

" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
"set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
:set hlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" マウスモード有効
set mouse=a
" xtermとscreen対応
set ttymouse=xterm2
" コマンドを画面最下部に表示する
set showcmd
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,],~
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" 他で書き換えられたら自動で読み直す
set autoread
"起動時に前回のundo履歴を復元
set undodir=~/.vimundo undofile
"ルーラーを表示
set ruler
set title

" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

"標準タブは4
set tabstop=4
"set softtabstop=4
"自動的にインデントする
set autoindent
"実はスマートはウザかったりする。
"set smartindent
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab


" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
 
" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
 
    if a:bang == ''
        pwd
    endif
endfunction
 
" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif


"---------------------------------------------------
" キーマップ
"---------------------------------------------------
"空行のインデントを勝手に消さない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" vを二回で行末まで選択
vnoremap v $h
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

"バッファを切り替えたり
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>
nmap bb :ls<CR>:buf 
nmap qq :close<CR>

"バッファの末尾まで移動したら先頭に戻る
"http://d.hatena.ne.jp/osyo-manga/20140703/1404382869
function! Up(key)
    if line(".") == 1
        return ":call cursor(line('$'), col('.'))\<CR>"
    else
        return a:key
    endif
endfunction


function! Down(key)
    if line(".") == line("$")
        return ":call cursor(1, col('.'))\<CR>"
    else
        return a:key
    endif
endfunction


nnoremap <expr><silent> k Up("gk")
nnoremap <expr><silent> j Down("gj")

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif
 
"表示行単位で行移動する(行末で折り返さなくしたので不要)
"nnoremap <silent> j gj
"nnoremap <silent> k gk
"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
"<space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>

"----------------------
" 設定ファイル
""---------------------
nnoremap <Space>.   :<C-u>edit   $MYVIMRC<Enter>
nnoremap <Space>s.  :<C-u>source $MYVIMRC<Enter>
nnoremap <Space>g.  :<C-u>edit   $MYGVIMRC<Enter>
noremap  <Space>gs. :<C-u>source $MYGVIMRC<Enter>


"================================
" vim-indent-guides
"================================

" indent-guides を有効にする
au VimEnter * IndentGuidesEnable

" 2インデント目からガイドする
let g:indent_guides_start_level = 2

" 自動カラーを無効にして手動で設定する
let g:indent_guides_auto_colors = 0

" 奇数インデントのガイドカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black

" 偶数インデントのガイドカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray

" ハイライト色の変化の幅 (Terminal では未サポート)
let g:indent_guides_color_change_percent = 20

" ガイドの幅
let g:indent_guides_guide_size = 2

" ガイド幅をインデント幅に合わせる
"let g:indent_guides_guide_size = &tabstop

"================================
" PHP用設定
"================================
" PHP辞書ファイル指定
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
" PHPの関数やクラスの折りたたみ
let php_folding = 0
" 文字列の中のSQLをハイライト
let php_sql_query = 1
" Baselibメソッドのハイライト
let php_baselib = 1
" HTMLもハイライト
let php_htmlInStrings = 1
" <? を無効にする→ハイライト除外にする
let php_noShortTags = 1
" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1
" SQLのPHP文字リテラルへの整形(:Sqltop, :Sqlfromp)
function! SQLToPHP()
%s/^\(.\+\)$/"\1 " \./g
 
normal G$
execute "normal ?.&lt;CR&gt;"
normal xxggVG
echo "Convert to PHP String is finished."
endfunction
command! Sqltop :call SQLToPHP()
function! SQLFromPHP()
%s/^"\(.\+\) " *\.*$/\1/g
 
normal ggVG
echo "Convert from PHP String is finished."
endfunction
command! Sqlfromp :call SQLFromPHP()
" ハイライト色設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
 
" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
	" neocomplete用設定
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
	    let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
	
	" インサートモードで上下移動したときに引っかかるので
	inoremap <expr><c-j> pumvisible() ? neocomplete#close_popup()."\<Up>" : "\<Up>"
	inoremap <expr><c-k> pumvisible() ? neocomplete#close_popup()."\<Down>" : "\<Down>"
	inoremap <expr><Up> pumvisible() ? neocomplete#close_popup()."\<Up>" : "\<Up>"
	inoremap <expr><Down> pumvisible() ? neocomplete#close_popup()."\<Down>" : "\<Down>"

	
elseif neobundle#is_installed('neocomplcache')
	" neocomplcache用設定
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_ignore_case = 1
	let g:neocomplcache_enable_smart_case = 1
	if !exists('g:neocomplcache_keyword_patterns')
	    let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns._ = '\h\w*'
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"================================
" yankround {{{

nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
" }}}



"================================
"" over.vim {{{
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" }}}


"================================
" python用設定
"================================
autocmd BufNewFile,BufRead *.py setl autoindent
autocmd BufNewFile,BufRead *.py setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufNewFile,BufRead *.py setl tabstop=4 noexpandtab shiftwidth=4 softtabstop=4


"================================
" Perl用設定
"================================
"autocmd BufNewFile,BufRead *.psgi   set filetype=perl
"autocmd BufNewFile,BufRead *.t      set filetype=perl
" Enable snipMate compatibility feature.↲
"let g:neosnippet#enable_snipmate_compatibility = 1
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
 
" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/snippets/snippets'
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = { 'default'    : '', 'perl'       : $HOME . '/.vim/dict/perl.dict' }
 
 
"================================
" Java用設定
"================================
"SQLのJava文字リテラルへの整形(:Sqltoj, :Sqlfromj)
function! SQLToJava()
%s/^\(.\+\)$/"\1 " \+/g
 
normal G$
execute "normal ?+\&lt;CR&gt;"
normal xxggVG
echo "Convert to Java String is finished."
endfunction
command! Sqltoj :call SQLToJava()
function! SQLFromJava()
%s/^"\(.\+\) " *+*$/\1/g
 
normal ggVG
echo "Convert from Java String is finished."
endfunction
command! Sqlfromj :call SQLFromJava()
 
" Ruby用設定
" :makeでRuby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l


"================================
" Scala用設定
"================================
" ファイルタイプの追加
augroup filetypedetect
autocmd! BufNewFile,BufRead *.scala setfiletype scala
autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
 
" 行末、行の最初への移動のキーマップ設定
:map! <C-e> <Esc>$a
:map! <C-a> <Esc>^a
:map <C-e> <Esc>$a
:map <C-a> <Esc>^a
 
" Ctrl+dで$、Ctrl+aで@
inoremap <C-d> $
inoremap <C-a> @
 
" \ + rでスクリプト実行
nmap <Leader>r <plug>(quickrun)


"================================
" powershell
"================================
:let g:ps1_nofold_blocks = 1
:let g:ps1_nofold_sig = 1

"================================
" json整形
"================================

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

"================================
" 全角スペースのハイライトを設定
"================================
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction
 
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM guibg=Purple guifg=NONE
endif

"================================
" lightline.vim 
"================================
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[ReadOnly]' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



"================================
"memolist.vim
"================================
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

let g:memolist_memo_suffix = "txt"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
let g:memolist_path = "~/Dropbox/vim/memolist"
let g:memolist_template_dir_path = "~/.vim/template/memolist"

"FuzzyFinder.vim
nmap mf :FufFile <C-r>=expand(g:memolist_path."/")<CR><CR>

"vim-markdown
au BufRead,BufNewFile *.txt set filetype=markdown

"------------------------------------------------
"Clang を使用して非同期で C++ のコード補完
"------------------------------------------------
" clang コマンドの設定
let g:marching_clang_command = "C:\Program Files (x86)\LLVM\bin"

" オプションを追加する場合
let g:marching_clang_command_option="-std=c++1y"

" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
\   "C:/MinGW/lib/gcc/mingw32/4.8.1/include"
\]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムに補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)


"vim reanimate
" 保存先のディレクトリ
let g:reanimate_save_dir = $VIM."/.vim/save_point"

" デフォルトの保存名
let g:reanimate_default_save_name = "latest"

" sessionoptions
let g:reanimate_sessionoptions="curdir,folds,globals,help,localoptions,slash,tabpages,winsize"

" 無効にする機能があれば
" let g:reanimate_disables = ["reanimate_session", "reanimate_viminfo", "reanimate_window"]


" ステータスラインに現在の保存名を出力
function! Last_point()
    return reanimate#is_saved() ? reanimate#last_point() : "no save"
endfunction
set statusline=%=[%{Last_point()}\]\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%03l,%03v]

"終了時に毎回上書きするか聞いてきてうざいのでコメントアウト
"" オートコマンド
"augroup SavePoint
"    autocmd!
"    " 終了時に保存を行う
"    autocmd VimLeavePre * ReanimateSave
"
"    " バッファに書き込む時に一緒の保存する
""    autocmd BufWritePost * ReanimateSave
"    
"    " CursorHold 時には ReanimateSaveCursorHold を使用する
""     autocmd CursorHold * ReanimateSaveCursorHold
"    
"    " 自動的に復元する場合
""     autocmd VimEnter * ReanimateLoad
"augroup END
"
"
"" ユーザ側で reanimate.vim のイベントに処理を hook する
"let s:event = {
"\    "name" : "user_event",
"\}
"
"function! s:event.load_pre(...)
"    " 読み込み前に全てのバッファを保存
"    :wall
"    " 復元前にタブを削除する
"    :tabonly
"endfunction
"
"function! s:event.save_pre(...)
"    " 保存前に args を削除する
"    try
"        :execute "argd *"
"    catch
"    endtry
"endfunction
"
"call reanimate#hook(s:event)
"unlet s:event


