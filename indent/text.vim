"------------------------------------------------------------------------------
"  Description: Vim text indent file
"  Help Page: ft-vim-indent
"------------------------------------------------------------------------------

" Only load this indent file when no other was loaded.
if exists("b:did_indent") || version < 700
   finish
endif

let b:did_indent = 45

setlocal noautoindent
setlocal nosmartindent
" setlocal textwidth=79
" setlocal formatoptions+=tcan2
setlocal formatoptions+=tca1
setlocal equalprg=fmt

" vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker

