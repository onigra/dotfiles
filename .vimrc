"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
" <Vundle see="https://github.com/gmarik/vundle/blob/master/README.md">
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'thinca/vim-quickrun'
Bundle 'The-NERD-tree'
Bundle 'neocomplcache'
Bundle 'surround.vim'
" </Vundle>
" <neocomplcache see="https://github.com/Shougo/neocomplcache/blob/master/README">
let g:neocomplcache_enable_at_startup = 1
" </neocomplcache>

" start original .vimrc statements
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
set clipboard+=unnamed           " OSのクリップボードを使用する
set mouse=a                      " ターミナルでマウスを使用できるようにする
set clipboard=unnamed            " ヤンクした文字は、システムのクリップボードに入れる
set hlsearch                     " 検索結果をハイライト
set guioptions+=a
set ttymouse=xterm2

" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa

" ESCキー連打で検索ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
