
if has('gui_running')

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


  let g:Tlist_Show_One_File = 1

  " GUI
  " Nice window title
  if has('title')
     set titlestring=
     set titlestring+=%f\              " file name
     set titlestring+=%h%m%r%w           " flags
     set titlestring+=\ -\ %{v:progname}    " program name
  endif

endif
