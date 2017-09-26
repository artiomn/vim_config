"
" Open urls with browser.
"

fun! OpenURL(url)
   if has("win32")
      silent execute '!start ' . g:browser . " '" . a:url . "' >NUL 2>&1"
   else
      silent execute '!' . g:browser . " '" . a:url . "' >/dev/null 2>&1 &"
   endif
   redraw!
endf

command! -bar -nargs=1 Openurl call OpenURL("<args>")

