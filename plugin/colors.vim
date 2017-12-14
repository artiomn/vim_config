"
" Setting color scheme and another colors.
"


let $darkxterm='yes'
colorscheme molokai

" delek
" torte
" default

" Colors for &number.
hi LineNr NONE
hi LineNr term=bold ctermfg=green gui=bold guifg=darkblue guibg=lightgrey

" Check if we're using a dark background - this should be set then.
if $darkxterm != ''
   set background=dark

   " Fix colors for folded lines
   hi Folded      NONE
   hi Folded      ctermfg=darkblue ctermbg=grey
   hi FoldColumn  NONE
   hi FoldColumn  ctermfg=darkblue ctermbg=grey
else
   set background=light
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endif

if &textwidth > 0
   " Highlight long lines. Realized in autocommands.
"    hi LineTooLong ctermbg=lightred guibg=lightred
   " highlight column at 80.
   hi ColorColumn NONE
   hi ColorColumn ctermbg=lightgrey guibg=lightgrey
   if v:version > 702 |  exec "set cc=" . &textwidth | endif
endif

" Highlights the current line.
"set cursorline
" Highlights the current column.
set cursorcolumn

" Terminal underlining kicks legibility in the nuts.
" So what to do? Bold is (extremely) subtle, but it's better than nothing.
hi CursorLine   cterm=bold      ctermbg=none
hi CursorColumn cterm=bold      ctermbg=none

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Highlight space errors in program sources.
let c_space_errors=1
let java_space_errors = 1

" Set pattern matching highlight for brackets.
hi MatchParen guifg=#000000 guibg=#D0D090

let c_space_errors=1

" Black background under console.
hi Normal ctermbg=black
