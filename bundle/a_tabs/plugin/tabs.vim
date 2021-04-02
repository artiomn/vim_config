"
" Tabs plugin.
"


fun! MoveTabLeft()
   let current_tab = tabpagenr()
   if current_tab > 1
      let current_tab = current_tab - 2
      execute 'tabmove' current_tab
   endif
endf


fun! MoveTabRight()
   let current_tab = tabpagenr()
   execute 'tabmove' current_tab
endf


" Move windows to Adjacent Tabs or Create new Tabs to accommodate them.
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


" TabMessage: Put output of ex commands in a new tab.
fun! TabMessage(cmd)
   redir => message
   silent execute a:cmd
   redir END
   tabnew
   silent put=message
   set nomodified
endf

" Key mappings. {{{1
" C-T: create new tab
noremap <silent> <C-T> :tabnew<CR>
" C-Tab: next tab
noremap <silent> <C-Tab> :tabnext<CR>
" C-Shift-Tab: previous tab
noremap <silent> <C-S-Tab> :tabprevious<CR>

" C-T w: close tab
noremap <silent> <C-T>w :tabclose<CR>
" C-T o: close all other tabs
noremap <silent> <C-T>o :tabonly<CR>

" C-T f: edit the found file(s) in $path, in a new tab (like with :find)
noremap <silent> <C-T>f :tabfind<space>
" C-T m: move this tab (followed by a number, index of precedent)
noremap <silent> <C-T>m :tabs<CR>:tabm<Space>
" C-T <number>: got to tab specified
noremap <C-T> :tabnext<space>

map <leader>tl :call MoveTabLeft()<CR>
map <leader>tr :call MoveTabRight()<CR>

" 1}}}

" End tabs.
