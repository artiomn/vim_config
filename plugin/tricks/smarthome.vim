"
" Smart home plugin.
"

" Artiom N.(cl)2016

fun! SmartHome()
   let ll = strpart(getline('.'), -1, col('.'))
   if ll =~ '^\s\+$'
      | normal! 0
   else
      | normal! ^
   endif
endf

inoremap <silent><HOME> <C-O>:call SmartHome()<CR>
nnoremap <silent><HOME> :call SmartHome()<CR>

