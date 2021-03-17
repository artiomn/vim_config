"
" GUI-specific tweaks and settings.
"

" Artiom N.

if !has('gui_running')
  finish
endif

" 40 lines of text instead of 24
set lines=40

" Font setter.
if !exists("g:spf13_no_big_font")
 if has("unix") && has("gui_running")
	set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
  if has("mac") && has("gui_running")
	set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
  endif
elseif has("gui_running")
" Windows.
	set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
endif
endif

" Set terminal title
set title

"close toolbar
"set guioptions-=T
"set guioptions+=c
"set guioptions-=e

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
" On MacOS X and later...
set antialias

""" Toggle GUI Option:
fun! s:SwitchGui(opt)
exe "set go".(&go =~# a:opt? '-=' : '+=').a:opt
set lines=999
endf


" Nice window title
if has('title')
 set titlestring=
 set titlestring+=%f\              " file name
 set titlestring+=%h%m%r%w           " flags
 set titlestring+=\ -\ %{v:progname}    " program name
endif


"set lm=ru_RU.cp1251	" langmenu: language to be used for the menu
set winaltkeys=no	" Don't use ALT keys for menus.
set guioptions=gmMr	" list of flags that specify how the GUI works
"		T	= Toolbar
"		M	= '$VIMRUNTIME/menu.vim' isn't sourced.
"		m	= Show menu
"		t	= tear-off menus
"		L	= Left-hand scrollbar isn't present


