"
" Unix Mouse switching plugin.
"

" Artiom N.

"---------------------------------------------------------------------------
fun! Mousec(arg)
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

