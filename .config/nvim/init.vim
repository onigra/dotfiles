autocmd!

"-------------------------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " Filer
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('5t111111/denite-rails')

  " Filer
  call dein#add('cocopon/vaffle.vim')

  " 補完
  call dein#add('zxqfl/tabnine-vim')

  " Syntax check
  call dein#add('w0rp/ale')

  " Golang
  call dein#add('fatih/vim-go')

  " Rust
  call dein#add('rust-lang/rust.vim')

  " Toml
  call dein#add('cespare/vim-toml')

  " Ansible
  call dein#add('pearofducks/ansible-vim')

  " Hashicorp Products
  call dein#add('hashivim/vim-terraform')

  " Nginx
  call dein#add('vim-scripts/nginx.vim')

  " Colorscheme
  call dein#add('joedicastro/vim-molokai256')
  call dein#add('cocopon/iceberg.vim')
  call dein#add('dracula/vim')

  " Status line
  call dein#add('bling/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Tag Jump
  call dein#add('vim-scripts/taglist.vim')

  " Utils
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('thinca/vim-quickrun')
  call dein#add('tpope/vim-surround')
  call dein#add('kana/vim-smartword')
  call dein#add('vim-scripts/AnsiEsc.vim')
  call dein#add('osyo-manga/vim-over')
  call dein#add('Yggdroot/indentLine')
  call dein#add('tpope/vim-endwise')

  " 特殊な編集
  " call dein#add('junegunn/vim-easy-align')
  " call dein#add('terryma/vim-multiple-cursors')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"-------------------------------------------------------------------------------
" denite.nvim
"-------------------------------------------------------------------------------
" Keymap ----------------------

" [Space + f] がPrefix
nnoremap [Denite] <Nop>
nmap <Space>f [Denite]

" カレントディレクトリ
nnoremap <silent> [Denite]f :<C-u>Denite file buffer<CR>
" 最近開いたファイル
nnoremap <silent> [Denite]m :<C-u>Denite file_mru<CR>

" ESCキーでdeniteを終了
call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')

" insertモードの時にjjでnormalモードになる
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')

" [ctrl + v]で横に分割して開く
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', '<C-s>', '<denite:do_action:split>', 'noremap')
" [ctrl + s]で縦に分割して開く
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>', 'noremap')

call denite#custom#map('insert', '<C-w>', '<denite:insert_word:../>', 'noremap')

" Basic ----------------------

" プロンプトを # から > に変更
call denite#custom#option('default', 'prompt', '>')
" 表示位置を上部に変更
call denite#custom#option('default', 'direction', 'top')
" grepでagを使用するように設定
call denite#custom#var('grep', 'command', ['ag'])
" カレントディレクトリ内の検索もagを使用する
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

"-------------------------------------------------------------------------------
" denite.nvim
"-------------------------------------------------------------------------------
nnoremap <silent> [Denite]rr :<C-u>Denite<Space>rails:dwim<Return>
nnoremap <silent> [Denite]rm :<C-u>Denite<Space>rails:model<Return>
nnoremap <silent> [Denite]rc :<C-u>Denite<Space>rails:controller<Return>
nnoremap <silent> [Denite]rv :<C-u>Denite<Space>rails:view<Return>
nnoremap <silent> [Denite]rh :<C-u>Denite<Space>rails:helper<Return>
nnoremap <silent> [Denite]rt :<C-u>Denite<Space>rails:test<Return>
nnoremap <silent> [Denite]rs :<C-u>Denite<Space>rails:spec<Return>

"-------------------------------------------------------------------------------
" vaffle.vim
"-------------------------------------------------------------------------------
" C-eでvaffleを開く
nnoremap <silent><C-e> :Vaffle<Cr>

"-------------------------------------------------------------------------------
" airline
"-------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'

set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:airline_section_a = airline#section#create(['mode','','branch'])

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"-------------------------------------------------------------------------------
" indentLine
"-------------------------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_conceallevel = 2

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

"-------------------------------------------------------------------------------
" vim-easy-align
"-------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" rust-vim
"-------------------------------------------------------------------------------
let g:rustfmt_autosave = 1

"-------------------------------------------------------------------------------
" start original .vimrc statements
"-------------------------------------------------------------------------------
filetype on
filetype indent on
filetype plugin on
syntax on

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


"-------------------------------------------------------------------------------
" filetype
"-------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.md set filetype=markdown

"-------------------------------------------------------------------------------
" rspec
"-------------------------------------------------------------------------------
autocmd FileType quickrun AnsiEsc

let g:quickrun_config = {}
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
" Keybind
"-------------------------------------------------------------------------------
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
imap <C-p>  <ESC>"*pa

" ESCキー連打で検索ハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

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

function! MarkdownToRedmine()
  %s/######/h6./g
  %s/#####/h5./g
  %s/####/h4./g
  %s/###/h3./g
  %s/##/h2./g
  %s/#/h1./g
  %s/```\(.\+\)/<pre><code class=\"\1\">/g
  %s/```/<\/pre>/g
endfunction

command! MdtoRm call MarkdownToRedmine()

" タブ設定
nnoremap tn :<C-u>tabnew<CR>
nnoremap ut :<C-u>Unite tab<CR>

"-------------------------------------------------------------------------------
" Syntax highlight
"-------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme dracula

