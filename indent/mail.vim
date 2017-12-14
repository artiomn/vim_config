"
"  Description: Vim mail indent file
"  Help Page: ft-vim-indent
"


" Only load this indent file when no other was loaded.
if exists("b:did_indent") || version < 700
   finish
endif

let b:did_indent = 45

setlocal autoindent
setlocal textwidth=75
setlocal formatoptions+=tcanq
setlocal comments=n:>
setlocal equalprg=fmt

" vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker

