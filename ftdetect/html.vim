"
"  Vim HTML detection file
"


autocmd BufNewFile,BufRead *.hta setfiletype html

" All my .tpl files ARE html (What's the "smarty templates"?).
autocmd BufNewFile,BufRead *.tpl setfiletype html
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
