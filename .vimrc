"-------------------------------------------------------------------------------
" dein.vim
"-------------------------------------------------------------------------------
autocmd!

if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/dein/dein.vim

call dein#begin(expand('~/.vim/dein/cache'))

" Filer
call dein#add('Shougo/unite.vim')
call dein#add('basyura/unite-rails')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/neomru.vim')
call dein#add('sorah/unite-ghq')

" Auto complete
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

" Syntax check
call dein#add('w0rp/ale')

" Ruby
call dein#add('todesking/ruby_hl_lvar.vim')
call dein#add('osyo-manga/vim-monster')

" Lisp
call dein#add('losingkeys/vim-niji')
call dein#add('aharisu/vim_goshrepl')
call dein#add('aharisu/vim-gdev')

" Golang
call dein#add('fatih/vim-go')

" Kotlin
call dein#add('udalov/kotlin-vim')

" Coffee script
call dein#add('kchmck/vim-coffee-script')

" Slim
call dein#add('slim-template/vim-slim')

" Markdown
call dein#add('joker1007/vim-markdown-quote-syntax')

" Ansible
call dein#add('pearofducks/ansible-vim')

" Hashicorp Products
call dein#add('hashivim/vim-terraform')

" Nginx
call dein#add('vim-scripts/nginx.vim')

" Colorscheme
call dein#add('joedicastro/vim-molokai256')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('cocopon/iceberg.vim')

" Git plugins
call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')

" Status line
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" Utils
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('thinca/vim-splash')
call dein#add('thinca/vim-quickrun')
call dein#add('vim-scripts/taglist.vim')
call dein#add('tpope/vim-surround')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('junegunn/vim-easy-align')
call dein#add('kana/vim-smartword')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('vim-scripts/AnsiEsc.vim')
call dein#add('osyo-manga/vim-over')
call dein#add('Yggdroot/indentLine')
call dein#add('junegunn/vim-easy-align')
call dein#add('tpope/vim-endwise')

call dein#end()
filetype plugin indent on

"-------------------------------------------------------------------------------
" unite.vim
"-------------------------------------------------------------------------------
" unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

" 現在開いているファイルのディレクトリ下のファイル一覧。
" 開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite file buffer<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file file_mru<CR>
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
" unite rails
"-------------------------------------------------------------------------------
nnoremap <silent> [unite]rm :<C-u>Unite rails/model<Cr>
nnoremap <silent> [unite]rc :<C-u>Unite rails/controller<Cr>
nnoremap <silent> [unite]rv :<C-u>Unite rails/view<Cr>
nnoremap <silent> [unite]rn :<C-u>Unite rails/config<Cr>
nnoremap <silent> [unite]rl :<C-u>Unite rails/lib<Cr>
nnoremap <silent> [unite]rd :<C-u>Unite rails/db<Cr>
nnoremap <silent> [unite]rs :<C-u>Unite rails/spec<Cr>
nnoremap <silent> [unite]rg :<C-u>Unite rails/bundled_gem<Cr>
nnoremap <silent> [unite]rr :<C-u>Unite rails/root<Cr>
nnoremap <silent> [unite]ro :<C-u>Unite rails/route<Cr>

"-------------------------------------------------------------------------------
" vimfiler
"-------------------------------------------------------------------------------
" でフォルトのファイラをnetrwではなくvimfilerにする
let g:vimfiler_as_default_explorer = 1

"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

" C-eでvimfilerを開く
nnoremap <silent><C-e> :VimFiler -buffer-name=explorer -split -toggle -winwidth=45 -no-quit<Cr>

autocmd! FileType vimfiler call s:my_vimfiler_settings()

function! s:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  " sで横に開く
  nnoremap <buffer>s :call vimfiler#mappings#do_action('my_split')<Cr>
  " vで縦に開く
  nnoremap <buffer>v :call vimfiler#mappings#do_action('my_vsplit')<Cr>
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

"-------------------------------------------------------------------------------
" neocomplete
"-------------------------------------------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\ }

let g:neocomplete#keyword_patterns = {}
let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
vmap <CR> <Plug>(gosh_repl_send_block)

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
" Splash
"-------------------------------------------------------------------------------
let g:splash#path = expand('~/') . 'dotfiles/cheatsheat.txt'
nnoremap <silent><C-m> :Splash<CR>

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
" indentLine
"-------------------------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_conceallevel = 2

"-------------------------------------------------------------------------------
" vim-easy-align
"-------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
set ttymouse=xterm2
set display=lastline
set wrap
set wrapscan
set tabstop=2
set list
set listchars=tab:>>,trail:-,nbsp:%

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

" unite-ghq
nnoremap UG :<C-u>Unite ghq<CR>

"-------------------------------------------------------------------------------
" Syntax highlight
"-------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme iceberg

