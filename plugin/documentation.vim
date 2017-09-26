"
" Documentation support.
"

" Artiom N.

fun! LocalDoc()
   if &ft =~ "cpp"
   elseif &ft =~ "c"
      let l:cmd = "!man 3 "
   elseif &ft =~ "tcl"
      let l:cmd = "!man 3tcl "
   elseif &ft =~ "php"
   elseif &ft =~ "python"
      let l:cmd = "!pydoc "
   elseif &ft =~ "ruby"
   elseif &ft =~ "perl"
      let l:cmd = "!perldoc "
   elseif &ft =~ "vim"
      let l:cmd = "help "
   elseif &ft =~ "sh"
      let l:cmd = "!man "
   else
      let l:cmd = ""
      return
   endif

   if (strlen(l:cmd) == 0) | return | endif

   silent! exec l:cmd . expand("<cword>")
   redraw!
endf
"---------------------------------------------------------------------------------
fun! OnlineDoc()
" Modified by Artiom N. for more filetypes.
" Вск Янв 20 09:56:21 MSK 2013.

    if &ft =~ "cpp"
      let l:urlTemplate = "http://www.cplusplus.com/reference/%/"
"        let l:urlTemplate = "http://doc.trolltech.com/4.4/%.html"
"   if &ft =~ "cpp" || &ft == "c" || &ft =~ "ruby" || &ft =~ "php" || &ft =~ "python" 
"      let l:urlTemplate = "http://www.google.com/codesearch?q=%+lang:".&ft
   elseif &ft =~"c"
      let l:urlTemplate = "http://social.msdn.microsoft.com/search/ru-RU?query=%"
   elseif &ft =~ "tcl"
   elseif &ft =~ "php"
   " "en" has more comments.
      let l:urlTemplate = "http://php.net/manual/en/function.%.php"
   elseif &ft =~ "python"
      let l:urlTemplate = "http://riverbankcomputing.co.uk/static/Docs/PyQt4/html/%.html"
   elseif &ft =~ "ruby"
      let l:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
   elseif &ft =~ "perl"
      let l:urlTemplate = "http://perldoc.perl.org/functions/%.html"
   elseif &ft =~ "vim"
      let l:urlTemplate = "http://vimdoc.sourceforge.net/search.php?docs=both&search=%"
   elseif &ft =~ "sh"
      let l:urlTemplate = "http://man.he.net/?topic=%&section=all"
   else
      let l:urlTemplate = "http://google.com/#q=%"
      return
   endif

   let l:wordUnderCursor   = expand("<cword>")
   let l:url               = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")

   call OpenURL(l:url)
endf

