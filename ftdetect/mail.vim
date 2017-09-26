"------------------------------------------------------------------------------
"  Description: Vim mail detection file
"------------------------------------------------------------------------------


" Some Debian-specific things.
autocmd BufRead reportbug.*  setfiletype mail
autocmd BufRead reportbug-*  setfiletype mail
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
