"-------------------------------------------------------------------------------
" Plugins(Vundler)
" https://github.com/gmarik/vundle/blob/master/README.md
"-------------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'thinca/vim-quickrun'
Bundle 'The-NERD-tree'
Bundle 'Shougo/neocomplcache'
Bundle 'taichouchou2/vim-rsense'
Bundle 'surround.vim'
Bundle 'unite.vim'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'taglist.vim'

"-------------------------------------------------------------------------------
" neocomplcache
" https://github.com/Shougo/neocomplcache/blob/master/README
"-------------------------------------------------------------------------------
"let g:neocomplcache_enable_at_startup = 1
"let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
"let g:rsenseUseOmniFunc = 1
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"-------------------------------------------------------------------------------
" unite.vim
"-------------------------------------------------------------------------------
" 入力モードで開始
let g:vimfiler_as_default_explorer = 1
 "縦分割で開く
let g:unite_enable_split_vertically = 1
" バッファリスト
nnoremap <silent><Space>l :Unite Buffer<CR>
" 最近使ったファイル
nnoremap <silent><Space>m :Unite file_mru<CR>
" VimFilerを起動
nnoremap <silent><Space>f :UniteWithBufferDir -buffer-name=files file<CR>

"-------------------------------------------------------------------------------
" vim-powerline
"-------------------------------------------------------------------------------
"let g:Powerline_symbols = 'fancy'

"-------------------------------------------------------------------------------
" taglist.vim
"-------------------------------------------------------------------------------
set tags=tags
" taglistを開くショットカットキー
nnoremap <silent><leader>tl :Tlist<CR>
" ctagsのパス(Homebrew)
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" 現在編集中のソースのタグしか表示しない
let Tlist_Show_One_File = 1
" taglistのウィンドウが最後のウィンドウならばVimを閉じる
let Tlist_Exit_OnlyWindow = 1
" 自動表示
let Tlist_Auto_Open = 1
" 表示幅
let Tlist_WinWidth = 30
" 右側でtaglistのウィンドウを表示
"let Tlist_Use_Right_Window = 1

"-------------------------------------------------------------------------------
" start original .vimrc statements
"-------------------------------------------------------------------------------
filetype on
filetype indent on
filetype plugin on
syntax on

set laststatus=2
set statusline=%<%f:%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
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
set guioptions+=a
set ttymouse=xterm2

" カーソル行をハイライト
set cursorline
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
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
imap <C-p>  <ESC>"*pa

" ESCキー連打で検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" シンタックスハイライト
syntax enable
"set background=dark
"let g:solarized_termcolors=256
colorscheme desert
