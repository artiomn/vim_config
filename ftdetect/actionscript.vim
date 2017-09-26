"------------------------------------------------------------------------------
"  Description: Vim Action Script detection file
"------------------------------------------------------------------------------

" in filetype it's "Atlas", but "actionscript" is more actually.
autocmd BufNewFile,BufRead *.as setfiletype actionscript
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
