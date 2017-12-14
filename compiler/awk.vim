" Vim Compiler File
" Compiler:	awk
" Maintainer:	Artiom N. <>
" Last Change:	Sun Aug 13 19:40:17 MSD 2006

if exists("current_compiler")
    finish
endif

let current_compiler = "awk"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%Cawk:\ %f:%l:\ %p^\ %m,%Eawk:\ %f:%l:\ %m

CompilerSet makeprg=awk\ -f\ %

