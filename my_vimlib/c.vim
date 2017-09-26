" C/C++.

fun! Filetype_C()
   "set nocindent
   " Отступы для программ на C.
   "set cinoptions=:0,l1,t0,g0,(0
   setlocal tabstop=3
   setlocal shiftwidth=3
   setlocal expandtab
   setlocal cinoptions=e0p0}0(0)0
   setlocal cindent
   setlocal omnifunc=ccomplete#Complete

   nmap <leader>hh :call C_ToggleHeader(expand("%:p"))<CR>
   au! BufLeave * nunmap <leader>hh
endf
"---------------------------------------------------------------------------------
" Converts <name>.c to <name>.h and reverse.
" TODO: Find more correct way to get extension.
fun! C_Source2HeaderAndReverse(fname)
   let ext = a:fname[-2:]
   if ext == '.c' || ext == '.h'
      return substitute(a:fname, ext . "$", ext == '.c' ? '.h' : '.c', "")
   endif
   return ""
endf
"---------------------------------------------------------------------------------
" Toggles from <name>.c file to <name>.h and reverse. Stores the last locations
" into g:ToggleHeaderLastLine and g:ToggleHeaderLastPos.
" NOTE: I think that g:ToggleHeaderLastLine and g:ToggleHeaderLastPos will work
" only if we will not work with this func for other files.
" TODO: Check whether arrays exist in vim, or hash, to store there these values
" for corresponding files.
let g:ToggleHeaderLastLine = 0
let g:ToggleHeaderLastPos  = 0

fun! C_ToggleHeader(fname)
   let req_line               = g:ToggleHeaderLastLine
   let req_col                = g:ToggleHeaderLastPos
   let g:ToggleHeaderLastLine = line(".")
   let g:ToggleHeaderLastPos  = col(".")

   call OpenFileOnPos(C_Source2HeaderAndReverse(a:fname), req_line, req_col)
endf
"---------------------------------------------------------------------------------
fun! C_template()
   append
/**
 * @FILE@
 *
 * @DESC@
 *
 * @author @AUTHOR@ <@AUTHOREMAIL@>
 * @date @DATE@
 */



/* vim:set @MODELINE@ */
.

   call Template_Apply("c")
   call cursor(10, 1)
endf
"---------------------------------------------------------------------------------

