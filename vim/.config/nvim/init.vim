"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vimのディレクトリ
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
" Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('mikoto2000/buffer_selector.vim')
  noremap <Space><Space> <Esc>:call buffer_selector#OpenBufferSelector()<Enter>

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
  filetype plugin indent on
  syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



if has("syntax")
  syntax on
endif

" colorscheme molokai
colorscheme japanesque
set termguicolors " truecolor

set showmatch
set mouse=a

set confirm " 保存されていないファイルは終了時に保存確認
set hidden " 保存されていなくても別ファイルが開ける


" カーソル移動
set whichwrap=b,s,h,l,<,>,[,] " 行頭行末の左右移動で行をまたぐ

set number " 行番号
set title " ターミナルのタイトル表示

" 表示系

set laststatus=2 " ステータスバーを常に表示
set laststatus=2 " メッセージ行を2行確保
set cursorline " 行のハイライト
set list " 不可視文字可視化
set listchars=tab:»-,trail:-,nbsp:%,eol:↲,extends:»,precedes:« " 不可視文字指定

" タブ,インデント関係

set noexpandtab " ハードタブ
" set expandtab " ソフトタブ
set tabstop=2 " tab文字の表示文字数
set shiftwidth=2 " 自動で挿入するインデントの文字数
set softtabstop=0 " tabで挿入する文字数 無指定でts準拠
" :set ts= sw= sts= でコマンド設定可
set smartindent " 複数行貼り付けがおかしくなるかも。:set paste のあとペースト。

" 検索/置換

set hlsearch " 検索文字列のハイライト

" ビープ停止

set visualbell t_vb= " 空にする
set noerrorbells

" --------------------
" キーバインド
" --------------------

inoremap <silent> jj <ESC>
noremap <C-h> 0
noremap <C-l> $

" 括弧補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
