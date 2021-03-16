"
" Template common functions.
"

fun! Template_GetDesc()
   " let l:file = input("File title: ")
   let l:file = expand('%:t')
   let l:desc = input("File description: ")
   let l:date = strftime("%F %T %Z")

   return([l:file,l:desc,l:date])
endf


fun! Template_Apply(ft)
   let [file,desc,date]=Template_GetDesc()
   silent! execute ":%s/@FILE@/\\=file/"
   silent! execute ":%s/@DESC@/\\=desc/"
   silent! execute ":%s/@DATE@/\\=date/"
   silent! execute ":%s/@AUTHOR@/\\=g:C_AuthorName/"
   silent! execute ":%s/@AUTHOREMAIL@/\\=g:C_Email/"
   silent! execute ":%s/@MODELINE@/\\=\"ft=\" . a:ft . \" \" . g:C_Modeline"
endf
