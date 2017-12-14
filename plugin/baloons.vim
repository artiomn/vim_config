"
" Baloon tips.
"


fun! BaloonDict()
   let l:phrase = v:beval_text

   if has("unix")
      if match(l:phrase, '\c[a-zа-я]') != -1
         let l:result = system('dict ' . shellescape(l:phrase))
         if (v:shell_error != 0) | unlet! l:result | endif
      endif

      return((exists("l:result")) ? l:result : "")
   else
   endif

   return ""
endf


"
" Hints.
"

if has('gui_running')
   set bexpr=BaloonDict()
   set ballooneval
   set balloondelay=150

   " Ctrl + F2. Baloon tips toggle.
   nmap <silent> <C-F2> :set ballooneval!<CR>
   vmap <silent> <C-F2> <C-O>:set ballooneval!<CR>
   vmap <silent> <C-F2> <C-O>:set ballooneval!<CR>

endif

