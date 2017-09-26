"
" Font size adjuster.
"

" Artiom N.


if has('gui_running')
   let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
   let s:minfontsize = 6
   let s:maxfontsize = 16

   fun! AdjustFontSize(amount)
     if has('gui_gtk2')
       let fontname = substitute(&guifont, s:pattern, '\1', '')
       let cursize = substitute(&guifont, s:pattern, '\2', '')
       let newsize = cursize + a:amount
       if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
         let newfont = fontname . newsize
         let &guifont = newfont
       endif
     else
       echoerr "You need to run the GTK2 version of Vim to use this function."
     endif
   endf

   fun! LargerFont()
     call AdjustFontSize(1)
   endf

   fun! SmallerFont()
     call AdjustFontSize(-1)
   endf

   command! LargerFont call LargerFont()
   command! SmallerFont call SmallerFont()

   """ Increase/Decrease Fontsize:
   """ @see http://vim.wikia.com/wiki/VimTip760
   nnoremap <C-kPlus>	:LargerFont<CR>
   nnoremap <C-kMinus>	:SmallerFont<CR>
endif

