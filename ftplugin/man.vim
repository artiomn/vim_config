" Standard vim manpage reader plugin
"runtime ftplugin/man.vim

" Man:
" Define Man cmd to source script file which redefine this one.
command! -nargs=1 Man
  \ delcommand Man |
  \ runt ftplugin/man.vim |
  \ Man <args>


