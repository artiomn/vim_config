" Vim Compiler File
" Compiler:	cshell
" Maintainer:	Artiom N. <>
" Last Change:  Sun Aug 13 18:17:45 MSD 2006

if exists("current_compiler")
    finish
endif

let current_compiler = "cshell"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet efm=%m

CompilerSet makeprg=csh\ %

