"------------------------------------------------------------------------------
"  Description: Vim Sh (Bash) detection file
"------------------------------------------------------------------------------


autocmd BufNewFile,BufRead .functions  setfiletype sh
autocmd BufNewFile,BufRead .aliases    setfiletype sh
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
