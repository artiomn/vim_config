"
"  Vim simple text detection file.
"


" none -> text
autocmd BufRead,BufNewFile *
   \ if &filetype == '' |
   \   setfiletype=text |
   \ endif

finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
