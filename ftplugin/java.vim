"
" Vim Java file type plugin.
"


augroup java
   au!
   " Decompile java classes.
   au BufReadCmd	   *.class	exe '0r!jad -p <afile>'
   au BufReadCmd	   *.class	exe setlocal ft=java bt=nowrite nomod noma
   au FileType       java     compiler gcc
augroup END
