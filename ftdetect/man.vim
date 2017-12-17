"
"  Vim Unix manual detection file.
"


" Additional man pages detector for Unix-like systems.
autocmd BufNewFile,BufRead /usr/share/man/* setfiletype man
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
