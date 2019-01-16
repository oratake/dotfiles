" 初期設定
if has("syntax")
  syntax on
endif

set showmatch
set mouse=a

set number " 行番号
set title " ターミナルのタイトル

" タブ,インデント関係
set noexpandtab
set tabstop=2 " tab文字の表示文字数
set shiftwidth=2 " 自動で挿入するインデントの文字数
set softtabstop=0 " tabで挿入する文字数 無指定でts準拠
" :set ts= sw= sts= でコマンド設定可
set smartindent " 複数行貼り付けがおかしくなるかも。:set pasteのあとペースト。

" 行
set cursorline

set list " 空白文字可視化
set listchars=tab:»-,trail:-,nbsp:%,eol:↲,extends:»,precedes:«↲

" ビープ停止
set visualbell t_vb=
set noerrorbells
