"-------------------------------------------------------------------------------
" Plugins(NeoBundle)
" https://github.com/Shougo/neobundle.vim
"-------------------------------------------------------------------------------
autocmd!

set nocompatible
filetype off
set rtp+=~/dotfiles/neobundle.vim

if has('vim_starting')
  set runtimepath+=~/dotfiles/neobundle.vim
  call neobundle#rc(expand('~/.vim/'))
endif

" let g:neobundle_default_git_protocol='https'

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }

NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-splash'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'vim-scripts/AnsiEsc.vim'
" colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/wombat256.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'joedicastro/vim-molokai256'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tejr/sahara'

NeoBundleLazy 'nosami/Omnisharp', {
\ 'autoload': {'filetypes': ['cs']},
\ 'build': {
\     'mac': 'xbuild server/OmniSharp.sln'
\   }
\ }

"-------------------------------------------------------------------------------
" unite.vim
" http://www.karakaram.com/unite
"-------------------------------------------------------------------------------
" unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

" 現在開いているファイルのディレクトリ下のファイル一覧。
" 開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()

" unite general settings
" インサートモードで開始
let g:unite_enable_start_insert = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
" file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

function! s:unite_my_settings()"{{{
  " ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)

  " 入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)

  " 入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  " ctrl+sで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')

  " ctrl+vで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

  " ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" unite-grep {{{
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" unite-grepのキーマップ
" 選択した文字列をunite-grep
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }}}

" unite colorscheme
nnoremap <silent><C-o> :Unite colorscheme -auto-preview<Cr>

"-------------------------------------------------------------------------------
" vimfiler
" http://hrsh7th.hatenablog.com/entry/20120229/1330525683
"-------------------------------------------------------------------------------
nnoremap <silent><C-e> :VimFiler -buffer-name=explorer -split -toggle -winwidth=45 -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  " sで横に開く
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  " vで縦に開く
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

" 横に開く
let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

" 縦に開く
let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)

"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

"-------------------------------------------------------------------------------
" neocomplcache
" https://github.com/Shougo/neocomplcache/blob/master/README
"-------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
let g:rsenseUseOmniFunc = 1
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"-------------------------------------------------------------------------------
" vim-powerline
"-------------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

"-------------------------------------------------------------------------------
" Splash
"-------------------------------------------------------------------------------
let g:splash#path = expand('~/') . 'dotfiles/cheatsheat.txt'
nnoremap <silent><C-m> :Splash<CR>

"-------------------------------------------------------------------------------
" Marked
" http://blog.glidenote.com/blog/2013/01/10/vim-quickrun-marked/
"-------------------------------------------------------------------------------
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

"-------------------------------------------------------------------------------
" taglist.vim
"-------------------------------------------------------------------------------
set tags=tags=tags,./tags,**1/tags,tags;/Projects
" taglistを開くショットカットキー
nnoremap <silent><C-t> :Tlist<CR>
" ctagsのパス(Homebrew)
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
" 現在編集中のソースのタグしか表示しない
let Tlist_Show_One_File = 1
" taglistのウィンドウが最後のウィンドウならばVimを閉じる
let Tlist_Exit_OnlyWindow = 1
" 自動表示
let Tlist_Auto_Open = 1
" 表示幅
let Tlist_WinWidth = 30
" 右側でtaglistのウィンドウを表示
" let Tlist_Use_Right_Window = 1

"-------------------------------------------------------------------------------
" gitv, vim-fugitive
" http://d.hatena.ne.jp/cohama/20120417/1334679297
" http://d.hatena.ne.jp/cohama/20130517/1368806202
" http://www.gregsexton.org/portfolio/gitv/
"-------------------------------------------------------------------------------
nnoremap <silent><C-g> :Gitv<Cr>
nnoremap <silent><C-h> :Gitv!<Cr>
autocmd FileType git :setlocal foldlevel=99

"-------------------------------------------------------------------------------
" vim-auto-save
" http://qiita.com/kentaro/items/833075356d41e9d9bc75
"-------------------------------------------------------------------------------
" let g:auto_save = 1


"-------------------------------------------------------------------------------
" start original .vimrc statements
"-------------------------------------------------------------------------------
filetype on
filetype indent on
filetype plugin on
syntax on

" vim-powerlineを使う場合はコレをコメントアウト
" set statusline=%<%f:%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set laststatus=2
set t_Co=256
set backupcopy=yes
set encoding=utf-8
set helpfile=$VIMRUNTIME/doc/help.txt
set fileencodings=utf-8,cp932,euc-jp,iso-2011-jp
set fileformats=unix,dos,mac
set ambiwidth=double

let mapleader = ","              " キーマップリーダー
set autoindent                   " オートインデントの設定
set shiftwidth=2                 " オートインデント時の文字数
set expandtab                    " ソフトタブを有効にする
set number                       " 行番号の表示
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set clipboard+=unnamed           " ヤンクした文字は、OSのクリップボードにも入れる
set mouse=a                      " ターミナルでマウスを使用できるようにする
set hlsearch                     " 検索結果をハイライト
set cursorline                   " カーソル行をハイライト
set guioptions+=a
set ttymouse=xterm2

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

"-------------------------------------------------------------------------------
" rspec
"-------------------------------------------------------------------------------
autocmd FileType quickrun AnsiEsc

" let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'outputter': 'buffer',
  \ 'exec': 'bundle exec %c %o --color -tty %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'outputter': 'buffer',
  \ 'exec': '%c %o --color --tty %s'
  \}

function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/normal'}
  nnoremap <expr><silent> <Leader>lr "<Esc>:QuickRun<CR>"
endfunction

autocmd BufReadPost *_spec.rb call RSpecQuickrun()

"-------------------------------------------------------------------------------
" キーバインド編集
"-------------------------------------------------------------------------------
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
imap <C-p>  <ESC>"*pa

" ESCキー連打で検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Ctrl + 上下移動で5行分移動
nnoremap <C-k> 5<Up>
nnoremap <C-j> 5<Down>

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" US配列の設定
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

"-------------------------------------------------------------------------------
" シンタックスハイライト
"-------------------------------------------------------------------------------
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme molokai256
