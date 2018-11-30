"
" Bottom status line settings.
"

" Artiom N.

" Additional information in the status line.
set statusline=%<%F\ %h\ %r\ [%{&fileformat},\ %{&fileencoding}]%=buf\:\ [%{&encoding},\ mod=%M,\ %{&filetype},\ %l,%c%V\ (%P)],\ sym\:\ [%b,\ 0x%B]

" Always show status line.
set laststatus=2

"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"               | | | | |  |   |      |  |     |    |
"               | | | | |  |   |      |  |     |    + current
"               | | | | |  |   |      |  |     |       column
"               | | | | |  |   |      |  |     +-- current line
"               | | | | |  |   |      |  +-- current % into file
"               | | | | |  |   |      +-- current syntax in
"               | | | | |  |   |          square brackets
"               | | | | |  |   +-- current fileformat
"               | | | | |  +-- number of lines
"               | | | | +-- preview flag in square brackets
"               | | | +-- help flag in square brackets
"               | | +-- readonly flag in square brackets
"               | +-- modified flag in square brackets
"               +-- full path to file in the buffer


