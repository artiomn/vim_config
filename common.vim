"
" My Vim lib functions.
"


"
" Aliens functions.
"


"---------------------------------------------------------------------------------
"
" Utilities.
"

"
fun! StripTrailingSpaces()
   let currPos=Mark()
   exec 'v:^--\s*$:s:\s\+$::e'
   exec currPos
endf


" set diffexpr=MyDiff()
fun! MyDiff()
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif

   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   let eq = ''
   if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
         let cmd = '""' . $VIMRUNTIME . '\diff"'
         let eq = '"'
      else
         let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
   else
       let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endf


" AutoComplete.
fun! Mosh_Tab_Or_Complete()
   if (col('.') > 1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w')
      return "\<C-N>"
   else
      return "\<Tab>"
   endif
endf


