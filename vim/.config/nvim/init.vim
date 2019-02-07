" 参照各所
" VimでJavaScript開発環境を作成 https://qiita.com/KazuakiM/items/21054883b57f895875c0
" dein.vimによるプラグイン管理 Qiita （現行はこちらを使用したい） https://qiita.com/kawaz/items/ee725f6214f91337b42b


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
" let s:dein
" }}}

" dein.vimのディレクトリ
set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

let s:dein_cache_dir =$XDG_CACHE_HOME . '/dein'
let s:dein_config_dir =$XDG_CONFIG_HOME . '/nvim'

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

" Let dein manage dein
  call dein#add(s:dein_cache_dir.'/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml(s:dein_config_dir.'/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_config_dir.'/dein_lazy.toml', {'lazy': 1})
  

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('KazuakiM/neosnippet-snippets')
  call dein#add('KazuakiM/vim-qfstatusline')
  call dein#add('mojako/ref-sources.vim')
  call dein#add('pangloss/vim-javascript')
  " call dein#add('Shougo/neocomplete.vim') " OUTDATED -> deoplete
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-ref')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('osyo-manga/shabadou.vim')
  call dein#add('osyo-manga/vim-watchdogs')
  call dein#add('mustardamus/jqapi', {'lazy':1})
  call dein#add('tokuhirom/jsref',   {'lazy':1})

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('mikoto2000/buffer_selector.vim')
  noremap <Space><Space> <Esc>:call buffer_selector#OpenBufferSelector()<Enter>

  call map(dein#check_clean(), "delete(v:val,'rf')")


  call dein#end()
  call dein#save_state()
endif

" Required:
  filetype plugin indent on
  syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
elseif !has('nvim')
  call dein#load_toml(s:dein_config_dir.'/dein_no_nvim.toml', {'lazy': 0})
endif

"End dein Scripts-------------------------


if has("syntax")
  syntax on
endif

" colorscheme
colorscheme japanesque
set termguicolors " truecolor

set showmatch
set mouse=a

set confirm " 保存されていないファイルは終了時に保存確認
set hidden " 保存されていなくても別ファイルが開ける
set noswapfile " スワップファイルを作らない
set autoread " 編集中ファイルに変更があれば自動で読み直す
set showcmd " 入力中のコマンドをステータスに表示

" クリップボードとヤンクをリンク
" set clipboard&
" set clipboard^=unnamedplus
set clipboard+=unnamed

" クリップボード WSLのみ
if system('uname -a | grep Microsoft') != ""
  let g:clipboard = {
    \ 'name': 'myClipboard',
    \ 'copy': {
    \   '+': 'win32yank.exe -i',
    \   '*': 'win32yank.exe -i',
    \ },
    \ 'paste': {
    \   '+': 'win32yank.exe -o',
    \   '*': 'win32yank.exe -o',
    \ },
    \ 'cache_enabled': 1,
    \}
endif

" カーソル移動
" set whichwrap=b,s,h,l,<,>,[,] " 行頭行末の左右移動で行をまたぐ

set number " 行番号
set title " ターミナルのタイトル表示

" 表示系

set laststatus=2 " メッセージ行を2行確保(常に表示
set cursorline " 行のハイライト
" set cursorcolumn " 列のハイライト
" highlight CursorColumn ctermbg=Gray
" highlight CursorColumn ctermfg=Green
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set list " 不可視文字可視化
set listchars=tab:»-,trail:-,nbsp:%,eol:↲,extends:»,precedes:« " 不可視文字指定

" タブ,インデント関係

" set noexpandtab " ハードタブ
set expandtab " ソフトタブ
set tabstop=2 " tab文字の表示文字数
set shiftwidth=2 " 自動で挿入するインデントの文字数
set softtabstop=0 " tabで挿入する文字数 無指定でts準拠
" :set ts= sw= sts= でコマンド設定可
set smartindent " 複数行貼り付けがおかしくなるかも。:set paste のあとペースト。

" 検索/置換

set hlsearch " 検索文字列のハイライト
set ignorecase " 全て小文字なら大小文字区別なく検索
set smartcase " 大文字があれば区別して検索

" ビープ停止

set visualbell t_vb= " 空にする
set noerrorbells

" --------------------
" キーバインド
" --------------------

" 挿入モードからjj連打でesc
inoremap <silent> jj <ESC>
" 行頭行末移動変更
noremap H 0
noremap L $

" バッファ移動
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" コマンド上で%%でバッファと同じ階層を展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" 括弧補完
inoremap { {}<ESC>i
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>

" </でHTML閉じタグ補完
augroup HTMLCloser
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" ペイン操作関係
" https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')





" test
" if has('wsl')
source $XDG_CONFIG_HOME/nvim/init_local.vim
" endif
