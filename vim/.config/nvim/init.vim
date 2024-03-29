" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:dein_cache_dir = s:cache_home . '/dein'
let s:nvim_config_dir = s:config_home . '/nvim'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" DEIN SETTINGS {{{
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

" Let dein manage dein
  call dein#add(s:dein_repo_dir)

  call dein#load_toml(s:nvim_config_dir.'/dein.toml', {'lazy': 0})
  call dein#load_toml(s:nvim_config_dir.'/dein_lazy.toml', {'lazy': 1})

  if has('wsl')
    call dein#load_toml(s:nvim_config_dir.'/init_local.vim')
  endif

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
  call dein#load_toml(s:nvim_config_dir.'/dein_no_nvim.toml', {'lazy': 0})
endif

" End dein Scripts-}}}

if has("syntax")
  syntax on
endif

" colorscheme
" list: japanesque, japanesque_akebono, dracula, iceburg, monokai_pro, wombat256mod, benokai, railscasts, hybrid, yozakura
colorscheme japanesque_akebono
" :h xterm-true-color 参照
set termguicolors " truecolor
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set showmatch
set mouse=a

set confirm " 保存されていないファイルは終了時に保存確認
set hidden " 保存されていなくても別ファイルが開ける
set noswapfile " スワップファイルを作らない
set autoread " 編集中ファイルに変更があれば自動で読み直す
set showcmd " 入力中のコマンドをステータスに表示

" クリップボードとヤンクをリンク
" set clipboard&
set clipboard=unnamedplus
" set clipboard+=unnamed

" OUTDATED
" クリップボード WSLのみ
" if system('uname -a | grep Microsoft') != ""
"   let g:clipboard = {
"     \ 'name': 'myClipboard',
"     \ 'copy': {
"     \   '+': 'win32yank.exe -i',
"     \   '*': 'win32yank.exe -i',
"     \ },
"     \ 'paste': {
"     \   '+': 'win32yank.exe -o',
"     \   '*': 'win32yank.exe -o',
"     \ },
"     \ 'cache_enabled': 1,
"     \}
" endif

" カーソル移動
" set whichwrap=b,s,h,l,<,>,[,] " 行頭行末の左右移動で行をまたぐ

set number " 行番号
set relativenumber " 選択行からの相対行番号
set title " ターミナルのタイトル表示

" 表示系
set laststatus=2 " メッセージ行を2行確保(常に表示
set cursorline " 行のハイライト
" set cursorcolumn " 列のハイライト
" highlight CursorColumn ctermbg=Gray
" highlight CursorColumn ctermfg=Green
" set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set virtualedit=block
set list " 不可視文字可視化
set listchars=tab:»-,trail:-,nbsp:%,eol:↲,extends:»,precedes:« " 不可視文字指定

" メニュ
set wildmenu
set wildmode=list:longest,full

" エンコーディング,改行コード,eof,eol関係
set fileencodings=utf-8,sjis,cp932
set fileformats=unix,dos,mac
set noeol " eol無し
set nofixendofline

" タブ,インデント関係
" set noexpandtab " ハードタブ
set expandtab " ソフトタブ
set tabstop=2 " tab文字の表示文字数
set shiftwidth=2 " 自動で挿入するインデントの文字数
set softtabstop=0 " tabで挿入する文字数 無指定でts準拠
" set expandtab ts= sw= sts= で一気に設定可
set smartindent " 複数行貼り付けがおかしくなるかも。:set paste のあとペースト。
set breakindent " インデントと同じに折り返す

" 検索/置換
set hlsearch " 検索文字列のハイライト
set ignorecase " 全て小文字なら大小文字区別なく検索
set smartcase " 大文字があれば区別して検索

" ビープ停止
set visualbell t_vb= " 空にする
set noerrorbells

" 折りたたみ挙動 folding
" autocmd FileType vim setlocal foldmethod=marker

" Keymaps {{{
" モード毎マップ参照 : https://yu8mada.com/2018/08/02/the-difference-between-nmap-and-nnoremap-in-vim/

" Leader変更
nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"
" let mapleader = " "
" Leader Check
" nmap <Leader>a [not_binded] " これで使わない文字をnot_bindでエスケープできそう？
" nmap <Leader>b [not_binded]
" nmap <Leader>c [not_binded]
nmap <Leader>t [test]
noremap [test]t :<C-u>echo "SUCCEED"<CR>

nmap <Leader>fz :<C-u>FZF<CR>
nmap <Leader>ag :<C-u>Ag<CR>

" jj連打でesc
inoremap <silent> jj <ESC>
" c-]で右にesc
inoremap <C-]> <Esc><Right>

" 行頭行末移動変更
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" 誤動作防止
nnoremap <BS> <Nop>
" leaderのエスケープはleader部分に追加済み

" " 見かけ行移動
" noremap j gj
" noremap gj j
" noremap k gk
" noremap gk k

" xではヤンクしない
nnoremap x "_x
" Y行末までヤンク
nnoremap Y y$
" カーソル下単語ハイライト
nnoremap <silent> <Leader><Leader> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" 検索後中央に表示
nnoremap n nzz
nnoremap N Nzz
" スクロール改善
nnoremap <C-y> <C-y>k
nnoremap <C-e> <C-e>j
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz



" ハイライト消す
nnoremap <ESC><ESC> :<C-u>noh<CR>

" バッファ移動
nnoremap <silent> [b :<C-u>bprevious<CR>
nnoremap <silent> ]b :<C-u>bnext<CR>
nnoremap <silent> [B :<C-u>bfirst<CR>
nnoremap <silent> ]B :<C-u>blast<CR>

" コマンド上で%%でバッファと同じ階層を展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" 括弧補完
inoremap { {}<ESC>i
inoremap {<CR> {}<Left><CR><ESC><S-o>
inoremap {} {}
inoremap ( ()<ESC>i
inoremap (<CR> ()<Left><CR><ESC><S-o>
inoremap () ()
inoremap [ []<ESC>i
inoremap [<CR> []<Left><CR><ESC><S-o>
inoremap [] []

" カンマ移動最適化
inoremap "" ""<Left>
inoremap '' ''<Left>

" </でHTML閉じタグ補完
augroup HTMLCloser
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o><ESC>F<i
  autocmd Filetype php inoremap <buffer> </ </<C-x><C-o><ESC>F<i
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
" nnoremap sT :<C-u>Denite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
" denite 移行中
" nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" terminal mode キャンセル簡略化
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> jj <ESC>

" git (vim-figitive)


" 連打有効化
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" }}}
