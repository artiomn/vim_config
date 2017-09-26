"
" Tabs.
"

fun! MoveTabLeft()
   let current_tab = tabpagenr()
   if current_tab > 1
      let current_tab = current_tab - 2
      execute 'tabmove' current_tab
   endif
endf
"---------------------------------------------------------------------------------
fun! MoveTabRight()
   let current_tab = tabpagenr()
   execute 'tabmove' current_tab
endf
"---------------------------------------------------------------------------------
" Move windows to Adjacent Tabs or Create new Tabs to accomodate them.
fun! MoveToPrevTab()
   " there is only one window
   if tabpagenr('$') == 1 && winnr('$') == 1
      return
   endif
   " preparing new window
   let l:tab_nr = tabpagenr('$')
   let l:cur_buf = bufnr('%')
   if tabpagenr() != 1
      close!
      if l:tab_nr == tabpagenr('$')
         tabprev
      endif
      sp
   else
     close!
     exe "0tabnew"
   endif
   " opening current buffer in new window
   exe "b".l:cur_buf
endf
"---------------------------------------------------------------------------------
fun! MoveToNextTab()
   " there is only one window.
   if tabpagenr('$') == 1 && winnr('$') == 1
      return
   endif
   " preparing new window
   let l:tab_nr = tabpagenr('$')
   let l:cur_buf = bufnr('%')
   if tabpagenr() < tab_nr
      close!
      if l:tab_nr == tabpagenr('$')
         tabnext
      endif
      sp
   else
      close!
      tabnew
   endif
   " opening current buffer in new window
   exe "b".l:cur_buf
endf
"---------------------------------------------------------------------------------
" TabMessage: Put output of ex commands in a new tab.
fun! TabMessage(cmd)
   redir => message
   silent execute a:cmd
   redir END
   tabnew
   silent put=message
   set nomodified
endf
"---------------------------------------------------------------------------------

