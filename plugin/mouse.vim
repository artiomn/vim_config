"
" Mouse-specific settings and functions.
"

" Artiom N.

fun! Mousec(arg)
   " Mouse switch function.
   if (a:arg == "auto" && &paste) || a:arg == "off"
      set nopaste
      set mouse=
      echo "gpm [off]"
   else
      set paste
      set mouse=a
      set modifiable
      echo "gpm [on]"
   endif
endf


if exists(":command")
   command! -nargs=1 Mouse call Mousec(<f-args>)
endif


" Enable for all modes.
set mouse=a

" For the correct GPM switch function work (need before textwidth).
" If it's after textwidth, textwidth will not work. Side effects.
set paste

" Mouse, like M$ windows
set mousemodel=popup

" Hide the mouse pointer while typing.
set mousehide

"set ttymouse=xterm2

