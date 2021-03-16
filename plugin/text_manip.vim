"
" Useful lines, words and symbols manipulation mappings plugin.
"

" Artiom N.(cl)2016


fun! SwapLine(dir)
   let l:pos = getpos(".")
   silent exec "move " . a:dir
   call setpos(".", l:pos)
endf


" Kill line
noremap <C-k> "_dd
nmap <C-k> "_dd

" Line swapping.
nmap <silent> gl :call SwapLine("+1")<CR>
nmap <silent> gL :call SwapLine("-2")<CR>

" Delete the word right
map	<C-Del>	dw
" Delete the rest of the line
map	<C-S-Del>	d$

" Move lines up/down
nmap	<silent><C-Down>	:move +1<CR>
vmap	<silent><C-Down>	:move <C-R>=line("'>")+1<CR><CR><C-\><C-N>gv
imap	<C-Down>		<C-O><C-Down>

map	<silent><C-Up>		:move -2<CR>
imap	<C-Up>			<C-O><C-UP>
vmap	<silent><C-Up>		:move -2<CR><C-\><C-N>gv
"

" Delete blank lines.
noremap <Leader>dbl :g/^$/d<CR>:nohls<CR>

" Word swapping.
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>
" Char swapping.
nmap <silent> gc xph


" Alt-Backspace in normal mode.
" Undo: <M-BS>
"map	<M-BS>		<Undo>
"map	<M-S-BS>	<C-R>

map <M-BS> db
map! <M-BS> db
imap <M-BS> <ESC>ldbi
"imap <M-BS> <ESC>dawi
