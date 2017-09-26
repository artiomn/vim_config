" Vim compiler file
" Compiler:	make
" Maintainer: Artiom N.
" Last Change: Sun Aug 13 18:37:34 MSD 2006

if exists("current_compiler")
  finish
endif
let current_compiler = "make"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:%l:\ %m,%Dgmake[%*\\d]:\ Entering\ directory\ `%f',%Dgmake[%*\\d]:\ Leaving\ directory\ `%f'

