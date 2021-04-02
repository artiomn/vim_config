"
" Default keyboard settings.
"

" Artiom N.

"
" Keyboard settings{{{1
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

"1}}}

"
" Mappings. {{{1
"

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

" Functional keys mapping{{{2

" F1 - help.{{{3
map! <F1> <C-C><F1>
"3}}}

" F2 - wrapping toggle.{{{3
nmap <silent><F2> :setlocal wrap!<CR>
vmap <silent><F2> <C-O>:setlocal wrap!<CR>
imap <silent><F2> <C-O>:setlocal wrap!<CR>
" 3}}}

" F3 - mode switcher.{{{3

" Toggle line numbers.
nmap <silent> <F3> :setlocal number!<CR>
vmap <silent> <F3> <C-O>:setlocal number!<CR>
imap <silent> <F3> <C-O>:setlocal number!<CR>

" Highlight search.
nmap <silent><S-F3> :setlocal hlsearch! hlsearch?<CR>
vmap <silent><S-F3> <C-O>:setlocal hlsearch! hlsearch?<CR>
imap <silent><S-F3> <C-O>:setlocal hlsearch! hlsearch?<CR>

" List special characters.
nmap <silent><M-F3> :setlocal list! list?<CR>
vmap <silent><M-F3> <C-O>:setlocal list! list?<CR>
imap <silent><M-F3> <C-O>:setlocal list! list?<CR>
"3}}}

" F4 - marks.{{{3
map <silent><F4> :marks<cr>
vmap <silent><F4> <esc>:marks<cr>
imap <silent><F4> <esc>:marks<cr>
" 3}}}

" F5 - call translator.{{{3
nmap <silent><F5> :Translate expand("<cword>")<CR>
vmap <silent><F5> <ESC>:Translate expand("<cword>")<CR>
imap <silent><F5> <ESC>:Translate expand("<cword>")<CR>
"3}}}

" F6 - VimTip44: The last command-line change (those invoked with ":",
" e.g. :s/foo/bar ) can be repeated with the "@:" command.
map <silent><F6> @:

" VimTip637: execute accidently inserted commands
" If you are in insert mode and typed an command for normal mode, you can
" use it.  This mapping switches to normal mode, undo'es the last insertion
" and takes it as a command.
inoremap <C-ESC> <ESC>u@.


" F7 - searching.{{{3
" nnoremap	<F7>	/<C-R><C-W>
" cnoremap	<F7>	%s!!!g<Left><Left><Left>

" nnoremap	<C-F7>	:.,$s!\<<C-R><C-W>\>!!g<Left><Left>
" vnoremap	<C-F7>	y<C-\><C-N>:<C-U>.,$s!<C-R>=escape(@",'\!')<CR>!!g<Left><Left>
" cnoremap	<C-F7>	.,$s!!!g<Left><Left><Left>

" nnoremap	<M-F7>	:%s!\<<C-R><C-W>\>!!g<Left><Left>
" cnoremap	<M-F7>	%s!!!g<Left><Left><Left>

" Search current word in the other window
" noremap		<S-F7>	yiw<C-W>pgg:call search(@@)<CR>

" Search & replace the word under the cursor
nmap <C-S-F7> :%s/\<<c-r>=expand("<cword>")<cr>\>/

" 3}}}

" F8 - date and time.{{{3
"3}}}

" F9 - make.{{{3
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i
" 3}}}

map <silent><F10> :emenu Encoding.<TAB>
map <silent><F11> :Mouse auto<CR>
"nmap <silent><F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 2}}}


" CursorKeys: use screen lines editing mapping (make cursor keys work like in windows).{{{2
" ie: <C-Left><C-Right> move to next word.
nmap	<C-Left>	b
vmap	<C-S-Left>	b
nmap	<C-S-Left>	vb
imap	<C-S-Left>	<C-O>vb

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
"2}}}

" Copy and paste.{{{2
" have Y behave analogously to D rather than to dd
nmap Y y$

" With no selection - copy current line
nmap <C-Insert> "+yy
vmap <C-Insert> "+yi
imap <C-Insert> <C-O>"+yy
cmap <C-Insert> <C-Y>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>

" CTRL-C and CTRL-Insert are Copy
vmap <C-C> "+yi
imap <C-V> <C-O>"+gPi

""" Add selection to clipboard
vnoremap <silent><M-Insert>	:<C-U>let @c=@*<CR><C-\><C-N>gv"Cy:let @*=@c<CR>

""" Copy to clipboard:
cmap	<C-Insert>	<C-R>=setreg('*',getcmdline())?'':''<CR>
" Delete to the clipboard
map	<S-Del>	<ESC>"*yyddi
nmap	<S-Del>	"*dd


" Copy whole buffer to clipboard
nmap	<C-C>	:%yank *<CR>

" Copy current word to the clipboard
nnoremap	<M-S-Insert>	"*yiw

" Change current word with clipboard
" nnoremap	<M-C-Insert>	ciw<C-R>*<ESC>

" copy full-file-name to clipboard
nmap	<C-S-Insert>	:let @*=expand("%:p")<CR>

" Quick paste
""" Add selection to clipboard
vnoremap <silent><M-Insert>	:<C-U>let @c=@*<CR><C-\><C-N>gv"Cy:let @*=@c<CR>

"2}}}

" Section: Folding.{{{2

" Folding: view cursor line only
nmap zV zMzx

" Folding: Indent all lines{{{}}}
map <leader>ia mzggVG='z

" Tip1330: Easily open and close folds
"map	<expr><Space>	foldclosed('.')==-1?'l':'za'
"nmap	<Space> za
nmap	<CR>	zozt
"nmap	<Esc>	zczz

" Goto next/prev folder
nmap	<M-PageDown>	zjzvzt
nmap	<M-PageUp>	zkzv[zzt

" Folding: fold an entire block of code
map	<kPoint>	v%zf

"2}}}

" Control+Space words autocompletion.
imap <C-Space> <C-N>

" Make <Backspace> act as <Delete> in visual and normal modes.
vmap <silent><BS> x
nmap <silent><BS> d1h

" TODO:
" Alt+Bcksp for the word deletion.
" Doesn't work...
" cmap <a-bs> <c-w>
" imap <a-bs> <c-w>
" In insert and command mode:
"noremap		<C-BS>	db
"cnoremap	<C-BS>	<C-W>
"nmap	<M-Del>	diw

inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

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

nmap	<leader>gf	:try<bar>find <lt>cfile><bar>catch<bar>edit <lt>cfile><bar>endtry<cr>


nmap <leader>fixes :grep -r "FIXME" * <CR>:copen<CR>
nmap <leader>todo  :grep -r "TODO"  * <CR>:copen<CR>

"       make the word before the cursor uppercase. Handy to type words in
"       lowercase and then make them uppercase.
"imap <C-F> <Esc>gUiw`]a

"
" ,Sl = "squeeze lines" - turns a block of empty lines into *one* empty line
nmap ,Sl :g/^[<C-I> ]*$/,/[^<C-I> ]/-j<C-M>


"   turn executable bit on and off
nmap ,X :silent execute "!chmod a+x %"<CR>
nmap ,x :silent execute "!chmod a-x %"<CR>


" Switch buffers
nmap <leader><Tab> :buffer<SPACE><TAB>

" QuickFix: Development/Compile <F9>
" nmap	<silent><C-F9>	:wall<BAR>cclose<BAR>silent make<BAR>botright cwindow 4<CR>
" nmap	<silent><F9>	:botright cwindow 4<BAR>cnext<CR>zv
" nmap	<silent><S-F9>	:botright cwindow 4<BAR>cprev<CR>zv

" Meta-A (Alt+A) is Select all.
nnoremap	<M-a>	ggVG


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

" 1}}}

