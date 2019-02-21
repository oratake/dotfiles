"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/root/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.cache/dein')
  call dein#begin('/root/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/root/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" --------------------
" colors
" --------------------
if has("syntax")
  syntax on
endif

" colorscheme molokai
colorscheme japanesque
set termguicolors " truecolor

set showmatch
set mouse=a

set number " 行番号
set title " ターミナルのタイトル表示

" タブ,インデント関係
set noexpandtab
set tabstop=2 " tab文字の表示文字数
set shiftwidth=2 " 自動で挿入するインデントの文字数
set softtabstop=0 " tabで挿入する文字数 無指定でts準拠
" :set ts= sw= sts= でコマンド設定可
set smartindent " 複数行貼り付けがおかしくなるかも。:set paste のあとペースト。

" 行
set cursorline

set list " 空白文字可視化
set listchars=tab:»-,trail:-,nbsp:%,eol:↲,extends:»,precedes:«

" ビープ停止
set visualbell t_vb= " 空にする
set noerrorbells

" Keymapたち
inoremap <silent> jj <ESC>
noremap <C-h> 0
noremap <C-l> $
