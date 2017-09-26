" Vim Compiler File
" Compiler:	shell
" Maintainer:	Artiom N. <>
" Last Change:  Sun Aug 13 17:50:45 MSD 2006

if exists("current_compiler")
    finish
endif
let current_compiler = "shell"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet efm=%E%f:\ line\ %l:\ %m,%-Z%p[a-zA-Z0-9]

CompilerSet makeprg=sh\ %

