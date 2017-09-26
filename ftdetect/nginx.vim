"------------------------------------------------------------------------------
"  Description: Vim Nginx config detection file
"------------------------------------------------------------------------------

autocmd BufNewFile,BufRead /etc/nginx/*.conf setfiletype nginx
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" tim: foldmethod=marker
