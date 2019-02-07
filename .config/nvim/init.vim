autocmd!

let g:python_host_prog = expand('/usr/local/bin/python2')
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

"-------------------------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

"-------------------------------------------------------------------------------
" start original .vimrc statements
"-------------------------------------------------------------------------------
filetype on
filetype indent on
filetype plugin on

set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8                            " 保存時の文字コード
set fileencodings=utf-8,cp932,euc-jp,iso-2011-jp  " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac                      " 改行コードの自動判別. 左側が優先される
set ambiwidth=double                              " □や○文字が崩れる問題を解決. iTerm2の場合 Treat ambiguous-width characters as double width にチェック

set laststatus=2
set t_Co=256
set backupcopy=yes
set helpfile=$VIMRUNTIME/doc/help.txt
set undodir=D:~/.vim/undo

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
set display=lastline
set wrap
set wrapscan
set tabstop=2
set list
set listchars=tab:>>,trail:-,nbsp:%
set ttimeout
set ttimeoutlen=40

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"-------------------------------------------------------------------------------
" 保存時の動作
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" filetype
"-------------------------------------------------------------------------------
" Markdownじゃなかったら保存時に行末の空白を除去する
if expand("%:e") != 'md'
  autocmd BufWritePre * :%s/\s\+$//ge
endif

autocmd BufWritePre *.tf TerraformFmt
" autocmd BufWritePre *.rb gg=G

" Nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

" 保存時にtabをスペースに変換する
if expand("%:e") != 'go'
  autocmd BufWritePre * :%s/\t/  /ge
endif

autocmd BufRead,BufNewFile *.md set filetype=markdown

" 拡張子がjsonの場合はindentLineを無効にする
" jsonでindentLineがonになってるとダブルクォートが表示されなくてキモいため
autocmd Filetype json let g:indentLine_enabled = 0

"-------------------------------------------------------------------------------
" Keybind
"-------------------------------------------------------------------------------
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
imap <C-p>  <ESC>"*pa

" ESCキー連打で検索ハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" Ctrl + 上下移動で5行分移動
nnoremap <C-k> 5<Up>
nnoremap <C-j> 5<Down>

" US配列の設定
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" タブ設定
nnoremap tn :<C-u>tabnew<CR>

"-------------------------------------------------------------------------------
" Syntax highlight
"-------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme dracula
