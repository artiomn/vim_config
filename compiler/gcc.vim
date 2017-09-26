" Vim compiler file
" Compiler:		gcc - GNU C compiler
" Maintainer: Artiom N.
" Last Change: 2006 Aug 13

if exists("current_compiler")
  finish
endif
let current_compiler = "gcc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:%l:\ %m

