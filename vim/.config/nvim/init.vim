" 参照各所
" VimでJavaScript開発環境を作成 https://qiita.com/KazuakiM/items/21054883b57f895875c0

" Variables 変数たち
let s:envHome      = ! exists('s:envHome')      ? $HOME       : s:envHome

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vimのディレクトリ
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_cache_dir =$XDG_CACHE_HOME . '/dein'
let s:dein_config_dir =$XDG_CONFIG_HOME . '/nvim'

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

" Let dein manage dein
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

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


" マニュアルをネットワークを介さず参照
" vim-ref {{{
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nmap <silent>K <Plug>(ref-keyword)
let g:ref_no_default_key_mappings = 1
let g:ref_cache_dir               = $HOME . '/.vim/vim-ref/cache'
let g:ref_detect_filetype         = {
\    'css':        'phpmanual',
\    'html':       ['phpmanual',  'javascript', 'jquery'],
\    'javascript': ['javascript', 'jquery'],
\    'php':        ['phpmanual',  'javascript', 'jquery']
\}
let g:ref_javascript_doc_path = $HOME . '/.vim/dein.vim/repos/github.com/tokuhirom/jsref/htdocs'
let g:ref_jquery_doc_path     = $HOME . '/.vim/dein.vim/repos/github.com/mustardamus/jqapi'
let g:ref_phpmanual_path      = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_use_cache           = 1
let g:ref_use_vimproc         = 1
"}}}


" vim-qfstatusline {{{
function! MyStatuslineSyntax() abort "{{{
    let l:ret = qfstatusline#Update()
    if 0 < len(l:ret)
        if s:lineUpdate is# 0
            highlight StatusLine cterm=NONE gui=NONE ctermfg=Black guifg=Black ctermbg=Magenta guibg=Magenta
            let s:lineUpdate = 1
        endif
    elseif s:lineUpdate is# 1
        highlight StatusLine cterm=NONE gui=NONE ctermfg=Black guifg=Black ctermbg=Grey guibg=Grey
        let s:lineUpdate = 0
    endif
    return l:ret
endfunction "}}}

function! MyStatuslinePaste() abort "{{{
    if &paste is# 1
        return '(paste)'
    endif
    return ''
endfunction "}}}

let g:Qfstatusline#UpdateCmd = function('MyStatuslineSyntax')
set laststatus=2
set cmdheight=1
set statusline=\ %t\ %{MyStatuslinePaste()}\ %m\ %r\ %h\ %w\ %q\ %{MyStatuslineSyntax()}%=%l/%L\ \|\ %Y\ \|\ %{&fileformat}\ \|\ %{&fileencoding}\ 
"}}}

" vim-quickrun {{{
function! EslintFix() abort "{{{
    let l:quickrun_config_backup                  = g:quickrun_config['javascript']
    let g:quickrun_config['javascript']['cmdopt'] = l:quickrun_config_backup['cmdopt'] .' --config '. $HOME .'/.eslintrc.js --fix'
    let g:quickrun_config['javascript']['runner'] = 'system'

    QuickRun

    let g:quickrun_config['javascript'] = l:quickrun_config_backup
endfunction "}}}

nnoremap <Leader>run  :<C-u>QuickRun<CR>
nnoremap <Leader>es   :<C-u>call<Space>EslintFix()<CR>
let s:quickrun_config_javascript = {
\    'command':     'eslint',
\    'cmdopt':      '--cache --cache-location ' . s:envHome . '/.cache/eslint/.eslintcache --format compact --max-warnings 1 --no-color --no-ignore --quiet',
\    'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m,%-G%.%#',
\    'exec':        '%c %o %s:p'
\}
let g:quickrun_config = {
\    '_': {
\        'hook/close_buffer/enable_empty_data': 1,
\        'hook/close_buffer/enable_failure':    1,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':botright',
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           600
\    },
\    'javascript': {
\        'command':     s:quickrun_config_javascript['command'],
\        'cmdopt':      s:quickrun_config_javascript['cmdopt'] . ' --config ' . s:envHome . '/.eslintrc.js',
\        'errorformat': s:quickrun_config_javascript['errorformat'],
\        'exec':        s:quickrun_config_javascript['exec']
\    },
\    'javascript/watchdogs_checker': {
\        'type': 'watchdogs_checker/javascript'
\    },
\    'watchdogs_checker/_': {
\        'hook/close_quickfix/enable_exit':        1,
\        'hook/back_window/enable_exit':           0,
\        'hook/back_window/priority_exit':         1,
\        'hook/qfstatusline_update/enable_exit':   1,
\        'hook/qfstatusline_update/priority_exit': 2,
\        'outputter/quickfix/open_cmd':            ''
\    },
\    'watchdogs_checker/javascript': {
\        'command':     s:quickrun_config_javascript['command'],
\        'cmdopt':      s:quickrun_config_javascript['cmdopt'] . ' --config ' . s:envHome . '/.eslintrc.limit.js',
\        'errorformat': s:quickrun_config_javascript['errorformat'],
\        'exec':        s:quickrun_config_javascript['exec']
\    }
\}
unlet s:quickrun_config_javascript
"}}}

" shabadou.vim
" vim-watchdogs {{{
let g:watchdogs_check_BufWritePost_enable  = 1
let g:watchdogs_check_BufWritePost_enables = {'vim': 0}
let g:watchdogs_check_CursorHold_enable    = 1
let g:watchdogs_check_CursorHold_enables   = {'vim': 0}
"}}}

" neosnippet-snippets
" neosnippet.vim
" neoinclude.vim
" neocomplete.vim {{{
imap <silent><expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" neosnippet.vim
smap <silent><expr><TAB>  neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
nmap <silent><expr><TAB>  neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <silent><expr><C-x>  MyNeoCompleteCr()
imap <silent><expr><CR>   MyNeoCompleteCr()
nmap <silent><S-TAB> <ESC>a<C-r>=neosnippet#commands#_clear_markers()<CR>
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
"neocomplete.vim
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#data_directory               = $HOME .'/.vim/neocomplete.vim'
let g:neocomplete#delimiter_patterns           = {
\    'javascript': ['.'],
\    'php':        ['->', '::', '\'],
\    'ruby':       ['::']
\}
let g:neocomplete#enable_at_startup         = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_auto_delimiter     = 1
let g:neocomplete#enable_auto_select        = 0
let g:neocomplete#enable_fuzzy_completion   = 0
let g:neocomplete#enable_smart_case         = 1
let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#lock_buffer_name_pattern  = '\.log\|.*quickrun.*\|.jax'
let g:neocomplete#max_keyword_width         = 30
let g:neocomplete#max_list                  = 8
let g:neocomplete#min_keyword_length        = 3
let g:neocomplete#sources                   = {
\    '_':          ['neosnippet', 'file',               'buffer'],
\    'css':        ['neosnippet',         'dictionary', 'buffer'],
\    'html':       ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'javascript': ['neosnippet', 'file', 'dictionary', 'buffer'],
\    'php':        ['neosnippet', 'file', 'dictionary', 'buffer']
\}
let g:neocomplete#sources#buffer#cache_limit_size  = 50000
let g:neocomplete#sources#buffer#disabled_pattern  = '\.log\|\.jax'
let g:neocomplete#sources#buffer#max_keyword_width = 30
let g:neocomplete#sources#dictionary#dictionaries  = {
\    '_':          '',
\    'css':        $HOME . '/.vim/dict/css.dict',
\    'html':       $HOME . '/.vim/dict/html.dict',
\    'javascript': $HOME . '/.vim/dict/javascript.dict',
\    'php':        $HOME . '/.vim/dict/php.dict'
\}
let g:neocomplete#use_vimproc = 1
"neoinclude.vim
let g:neoinclude#exts          = {'php': ['php', 'inc', 'tpl']}
let g:neoinclude#max_processes = 5
"neosnippet.vim
let g:neosnippet#data_directory                = $HOME . '/.vim/neosnippet.vim'
let g:neosnippet#disable_runtime_snippets      = {'_' : 1}
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory            = $HOME . '/.vim/dein.vim/repos/github.com/KazuakiM/neosnippet-snippets/neosnippets'
function! MyNeoCompleteCr() abort "{{{
    if pumvisible() is# 0
        return "\<CR>X\<C-h>"
    elseif neosnippet#expandable_or_jumpable()
        return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<Left>\<Right>"
endfunction "}}}
"}}}


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

" カーソル移動
" set whichwrap=b,s,h,l,<,>,[,] " 行頭行末の左右移動で行をまたぐ

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

" </でHTML閉じタグ補完
augroup HTMLCloser
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
