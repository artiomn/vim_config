"
"  Description: Vim markdown indent file
"  Help Page: ft-vim-indent
"


" Only load this indent file when no other was loaded.
if exists("b:did_indent") || version < 700
   finish
endif

let b:did_indent = 45

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
setlocal textwidth=120
setlocal formatoptions+=tcan2wro
setlocal comments=n:>

" vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker

