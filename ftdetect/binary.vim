"
"  Vim binary detection file.
"


autocmd BufReadPre  *.bin,*.exe,*.com,*.dll setfiletype binary
finish

"if did_filetype()	" filetype already set..
"	  finish		" ..don't do these checks
"	endif
"	if getline(1) =~ '^#!.*\<mine\>'
"	  setfiletype mine
"	elseif getline(1) =~? '\<drawing\>'
"	  setfiletype drawing
"	endif

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
