"
" Default keyboard settings.
"

" Artiom N.

"
" Keyboard.
"

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Allow usage of cursor keys within insert mode.
set esckeys

" Use shifted cursor keys to start/stop selection
"set keymodel=startsel,stopsel

" No Select-mode: no replace selection with typing
"set selectmode=

" Keymaps switch by <C-^>
" set keymap=russian-jcukenwin
" Default keymap is a latin.

" Input method support.
set iminsert=0

" Allow for cursor beyond last character.
set virtualedit=onemore

"
" Section: Mappings. {{{1
"


" Functional keys mapping{{{2

" F2 - wrapping toggle.
nmap <F2> :set wrap!<CR>
vmap <F2> <C-O>:set wrap!<CR>
imap <F2> <C-O>:set wrap!<CR>

" F3 - toggle line numbers.
nmap <silent> <F3> :set number!<CR>
vmap <silent> <F3> <C-O>:set number!<CR>
imap <silent> <F3> <C-O>:set number!<CR>

" F4 - wrapping toggle.
nmap <silent><F4> <ESC>:set wrap!<CR>
vmap <silent><F4> <ESC>:set wrap!<CR>
imap <silent><F4> <ESC>:set wrap!<CR>

" F5 - call translator.
nmap <F5> :Translate expand("<cword>")<CR>
vmap <F5> <ESC>:Translate expand("<cword>")<CR>
imap <F5> <ESC>:Translate expand("<cword>")<CR>

" VimTip44: The last command-line change (those invoked with ":",
" e.g. :s/foo/bar ) can be repeated with the "@:" command.
"map	<F5>	@:

" F6 - prev buffer
nmap <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - next buffer
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i
map <F7> :Recode<CR>

"map <F8> :read !date<CR>
"map! <F8> <ESC>:read !date<CR>

" F8 - Marks
"map <F8> :marks<cr>
"vmap <F8> <esc>:marks<cr>
"imap <F8> <esc>:marks<cr>

" F9 to make.
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i


map <F10> :emenu Encoding.<TAB>
map <F12> :Mouse auto<CR>
" }}}

" CursorKeys: use screen lines.
" editing mapping (make cursor keys work like in windows).
" ie: <C-Left><C-Right> move to next word.
nmap	<C-Left>	b
vmap	<C-S-Left>	b
nmap	<C-S-Left>	vb
imap	<C-S-Left>	<C-O>vb

" Control+Space words autocompletion.
imap <C-Space> <C-N>

" Make <Backspace> act as <Delete> in visual and normal modes.
vmap <BS> x
"nmap <BS> d1h


" Alt+Bcksp for the word deletion.
cmap <a-bs> <c-w>
imap <a-bs> <c-w>

" Ctrl + F3 - list all errors.
nmap <C-F3> :cclose<cr>
vmap <C-F3> <esc>:cclose<cr>
imap <C-F3> <esc>:cclose<cr>


" have Y behave analogously to D rather than to dd 
nmap Y y$

" With no selection - copy current line
nmap	<C-Insert>	"+yy
imap	<C-Insert>	<C-O>"+yy
cmap	<C-Insert>	<C-Y>

":inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" SwitchCase:
"imap	<silent><Plug>SwitchCase <C-R>=(@@==#toupper(@@))?tolower(@@):(@@==#tolower(@@))?substitute(@@,'\<.','\u&',''):toupper(@@)<CR><C-O>`]
"nmap	<M-\>	ciw<Plug>SwitchCase
"vmap	<M-\>	c<C-\><C-N>i<Plug>SwitchCase<ESC>gv
"imap	<M-\>	<ESC>ciW<Plug>SwitchCase

" Digraphs:
dig ** 8226	" &bull;
dig .. 8230	" &hellip
"dig <space><space>	160	" &nbsp;



"imap	<silent><C-Z><C-F>	<C-R>='@(#) '.expand('%:p:~')<CR>
"imap	<silent><C-Z><C-V>	<C-R>='vim: set ft='.&ft.' ts='. &ts . ' noet fenc=' . &fenc . ':'<CR>
"imap	<silent><C-Z><C-R>	<C-R>='(c) '.copyright<CR>


imap	<C-R><C-D>		<C-R>=expand("%:p:h")<CR>/
imap	<C-R><C-E>		<C-R>=expand("%:p:~:.:h")<CR>/

nmap	<Leader>gf	:try<bar>find <lt>cfile><bar>catch<bar>edit <lt>cfile><bar>endtry<cr>


nmap \fixes :grep -r "FIXME" * <CR>:copen<CR>
nmap \todo  :grep -r "TODO"  * <CR>:copen<CR>


"Indent all lines
map <leader>ia mzggVG='z


" CTRL-C and CTRL-Insert are Copy
vmap <C-C> "+yi
vmap <C-Insert> "+yi
imap <C-V> <esc>"+gPi


" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>

" Search & replace the word under the cursor
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/


"       make the word before the cursor uppercase. Handy to type words in
"       lowercase and then make them uppercase.
"imap <C-F> <Esc>gUiw`]a

"
" ,Sl = "squeeze lines" - turns a block of empty lines into *one* empty line
"nmap ,Sl :g/^[<C-I> ]*$/,/[^<C-I> ]/-j<C-M>


"   turn executable bit on and off
nmap ,X :silent execute "!chmod a+x %"<CR>
nmap ,x :silent execute "!chmod a-x %"<CR>


" Select Current Word:
"nmap	<C-C>		ciw
"nmap	<C-Space>	ciw
"nmap	<S-Space>	ciW
"omap	<C-Space>	iw
"omap	<S-Space>	iW
"vmap	<C-Space>	iw
"vmap	<S-Space>	iW


" In insert and command mode:
map!	<F1>	<C-C><F1>
noremap		<C-BS>	db
cnoremap	<C-BS>	<C-W>
nmap	<M-Del>	diw

" Searching: <F7>
" nnoremap	<F7>	/<C-R><C-W>
" cnoremap	<F7>	%s!!!g<Left><Left><Left>

" nnoremap	<C-F7>	:.,$s!\<<C-R><C-W>\>!!g<Left><Left>
" vnoremap	<C-F7>	y<C-\><C-N>:<C-U>.,$s!<C-R>=escape(@",'\!')<CR>!!g<Left><Left>
" cnoremap	<C-F7>	.,$s!!!g<Left><Left><Left>

" nnoremap	<M-F7>	:%s!\<<C-R><C-W>\>!!g<Left><Left>
" cnoremap	<M-F7>	%s!!!g<Left><Left><Left>

" Search current word in the other window
" noremap		<S-F7>	yiw<C-W>pgg:call search(@@)<CR>

" Switch buffers
nmap	<Leader><Tab>	:buffer<SPACE><TAB>

" QuickFix: Development/Compile <F9>
" nmap	<silent><C-F9>	:wall<BAR>cclose<BAR>silent make<BAR>botright cwindow 4<CR>
" nmap	<silent><F9>	:botright cwindow 4<BAR>cnext<CR>zv
" nmap	<silent><S-F9>	:botright cwindow 4<BAR>cprev<CR>zv

" Mode Switch:
" nmap	<silent><F3>	:setlocal wrap! wrap?<CR>
" nmap	<silent><M-F3>	:setlocal list! list?<CR>
" nmap	<silent><C-F3>	:setlocal number! number?<CR>
" nmap	<silent><S-F3>	:setlocal hlsearch! hlsearch?<CR>
" nmap	<silent><C-S-F3> :setlocal cursorline! cursorcolumn! cursorcolumn?<CR>

" Tip1330: Easily open and close folds
"map	<expr><Space>	foldclosed('.')==-1?'l':'za'
"nmap	<Space> za
nmap	<CR>	zozt
"nmap	<Esc>	zczz

" Goto next/prev folder
nmap	<M-PageDown>	zjzvzt
nmap	<M-PageUp>	zkzv[zzt

" Fold an entire block of code
map	<kPoint>	v%zf

" View cursor line only
nmap	zV		zMzx


""" Add selection to clipboard
vnoremap <silent><M-Insert>	:<C-U>let @c=@*<CR><C-\><C-N>gv"Cy:let @*=@c<CR>

""" Copy to clipboard:
cmap	<C-Insert>	<C-R>=setreg('*',getcmdline())?'':''<CR>
" Delete to the clipboard
map	<S-Del>	<ESC>"*yyddi
nmap	<S-Del>	"*dd



" Copy whole buffer to clipboard
nmap	<C-Insert>	:%yank *<CR>

" Copy current word to the clipboard
nnoremap	<M-S-Insert>	"*yiw

" Change current word with clipboard
" nnoremap	<M-C-Insert>	ciw<C-R>*<ESC>

" copy full-file-name to clipboard
nmap	<C-S-Insert>	:let @*=expand("%:p")<CR>

" Meta-A (Alt+A) is Select all.
nnoremap	<M-a>	ggVG


if &sel == 'exclusive'
   nmap	<C-Right>	w
   vmap	<C-S-Right>	w
   nmap	<C-S-Right>	vw
   imap	<C-S-Right>	<C-O>vw
else
   nmap	<C-Right>	e
   vmap	<C-S-Right>	e
   nmap	<C-S-Right>	ve
   imap	<C-S-Right>	<C-O>ve
endif

" In visual mode, <TAB> will shift the block and restore selection
" <S-TAB> will do the same thing, going backward.
vmap	<Tab>	>gv
vmap	<S-Tab>	<LT>gv

nmap	<S-Tab>	<LT><LT>

inoremap <S-Tab>	<C-D>
" Smart Home:
"nnoremap	<expr><Home>	matchend(getline('.'),'^\s*')<col('.')-1? '^':'0'

" Smart Tab: completion
" inoremap	<expr><Tab>	getline('.')[col('.')-2]!~'\k'? "\<Tab>":"\<C-n>"

" Quick paste
inoremap	<M-p>	<C-R>"

" Correct syntax synchronization.
"map	<leader><leader>r	:syntax sync fromstart<cr>


" VimTip637: execute accidently inserted commands
" If you are in insert mode and typed an command for normal mode, you can
" use it.  This mapping switches to normal mode, undo'es the last insertion
" and takes it as a command.
inoremap	<C-ESC>	<ESC>u@.
