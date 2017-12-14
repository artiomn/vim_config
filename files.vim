"
" My Vim lib functions.
"

"---------------------------------------------------------------------------------
fun! OpenFileOnPos(fname, lin, col)
" Opens file in current buffer, and goes to lin line and col column
" TODO: Check whether vim has a such function.
   exe "normal \:e " . a:fname . "\<CR>"
   exe "normal " . a:lin . "G"
   exe "normal " . a:col . "|"
endf
"---------------------------------------------------------------------------------

function! Preserve(command) "{{{
   " preparation: save last search, and cursor position.
   let _s=@/
   let l = line(".")
   let c = col(".")
   " do the business:
   execute a:command
   " clean up: restore previous search history, and cursor position
   let @/=_s
   call cursor(l, c)
 endf "}}}

function! StripTrailingWhitespace() "{{{
   call Preserve("%s/\\s\\+$//e")
endf "}}}
