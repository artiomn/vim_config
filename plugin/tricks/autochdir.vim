"
" Automatically cd to directory of the buffer.
"

if exists('+autochdir')
   set autochdir
else
   au BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! lcd %:p:h:gs/ /\\ /
endif

" CD: to the dir of the current buffer for current window.
command! Cd lcd %:p:h 

