"
" Yakuake console support.
"

finish

if has("unix")
   if exists(":command")
      command! -n=0 -bar Yakuake :call Yakuake_Open()
   fi

   augroup yakuake
         au!
         au VimEnter * call Yakuake()
         au BufEnter,BufRead,BufNewFile * call Yakuake_Update()
         au VimLeave * call Yakuake_Restore()
      augroup END
   endif
endif
