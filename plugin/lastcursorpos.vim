" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).

if has("autocmd")
   au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif


"---------------------------------------------------------------------------------
fun! OpenFileOnPos(fname, lin, col)
" Opens file in current buffer, and goes to `lin` line and col column
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

