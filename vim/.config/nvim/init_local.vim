" ======================
" WSL local vim setting
" Github @oratake
" 2019/02
" ======================

" Cripboard
" -------------------
" Yank -> Clipboard
" (無名レジスタのヤンクから、クリップボードに)
" require: https://github.com/equalsraf/win32yank
augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('win32yank.exe -i', @")
augroup END
