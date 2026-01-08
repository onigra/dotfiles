autocmd!

"-------------------------------------------------------------------------------
" Plugins & Plugin Settings
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" vim-plug
" プラグインマネージャー
"-------------------------------------------------------------------------------
call plug#begin('~/.cache/nvim/plugged')

" Colorscheme
Plug 'dracula/vim'
Plug 'joedicastro/vim-molokai256'
Plug 'cocopon/iceberg.vim'

" ファジーファインダー
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" 補完
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Lint
Plug 'w0rp/ale'

Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/nginx.vim'

" リッチなステータスバー
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kana/vim-smartword'

" テキスト整形
" https://wonderwall.hatenablog.com/entry/2016/03/29/215904
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-quickrun'

call plug#end()

"-------------------------------------------------------------------------------
" vim-airline
" リッチなステータスバー
"-------------------------------------------------------------------------------
let g:airline_theme='angr'

"-------------------------------------------------------------------------------
" indentLine
" わかりやすいインデント表示
"-------------------------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_conceallevel = 2

"-------------------------------------------------------------------------------
" vim-easy-align
" テキスト整形
"-------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" nvim-lspconfig
"-------------------------------------------------------------------------------
lua require('nvim-lspconfig_config')

"-------------------------------------------------------------------------------
" nvim-cmp
" 補完設定
"-------------------------------------------------------------------------------
" 補完メニューの動作設定
" menuone: 候補が1つでもメニュー表示, noinsert: 自動挿入しない, noselect: 自動選択しない
set completeopt=menuone,noinsert,noselect

" 補完使用時の余計なメッセージを表示しない
set shortmess+=c


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
set undodir=~/.config/nvim/undo

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
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set clipboard+=unnamed           " ヤンクした文字は、OSのクリップボードにも入れる
set mouse=a                      " ターミナルでマウスを使用できるようにする
set hlsearch                     " 検索結果をハイライト
set cursorline                   " カーソル行をハイライト
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
" telescope.nvim
" ファジーファインダー
"-------------------------------------------------------------------------------
lua require('telescope_config')

"-------------------------------------------------------------------------------
" Syntax highlight
"-------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme molokai256

