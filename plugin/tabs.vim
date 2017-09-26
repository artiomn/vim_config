"
" Tabs plugin.
"

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

" End tabs.

