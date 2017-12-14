"
" Vim C++ detection file.
"

autocmd BufNewFile,BufReadPost *.c++,*.cxx,*.cpp,*.cc setfiletype=cpp

" Arduino C++ files.
autocmd BufNewFile,BufReadPost *.ino,*.pde setfiletype=cpp
finish

" vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
