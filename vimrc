"
" Vimrc from Artiom N.(cl)2021
"

" Description:
"
" Vim editor configuration: vimrc file.
" To use it, copy it to
"     for Unix and OS/2:      ~/.vim/vimrc or ~/.vimrc
"     for Amiga:              s:.vimrc
"     for MS-DOS and Win32:   $VIM\_vimrc
"     for OpenVMS:            sys$login:.vimrc

" Features:
"  - Cross-platform: Windows and Linux.
"  - GUI support.
"  - Spell checking.
"  - Autoreloading vimrc after editing.
"  - Words auto-completion.
"  - Misspelling words correcting (by abbreviations).
"  - Russian language support.
"  - Highlighting: TODO, colors.
"  - Correct file types settings (for Makefiles and other formal languages).

" IDEs:
"  - C/C++ IDE.
"  - Python IDE.


" TODO:
" Использовать разные словари в BaloonDict, в зависимости от контекста.
" Переделать мои функции.
" hlsearch привязать к клавише.
" Переделать функции и переменные в s:
" Автокоманда декомпиляции JAVA классов. Переделать.
" Шаблоны!!!.
" Описать функции и привязки клавиш.
" Ненужный try/catch на silent!.
" Все автокоманды за if has('autocmd')
" shellescape для всех вызовов.
" Переделать глобальные переменные на словари.
" debian.vim
" Проверить функции.
" Фолдинг секций.

"---------------------------------------------------------------------------
" Section: Common settings. {{{1
"---------------------------------------------------------------------------

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load only with C++ files!!!
let loaded_taglist = "no"

" Secure modeline.
set secure

" Find merge conflict markers.
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Especially need for Windows GUI.
set encoding=utf-8
scriptencoding utf-8

filetype off

function! s:is_it_first_run() " {{{1
    let l:f_name = "~/.vim/first-run"
    if !empty(expand(glob(l:f_name)))
        call delete(expand(l:f_name))
        return 1
    else
        return 0
    endif
endfunction " 1}}}


function! s:infect_plugins(plugin_list) abort " {{{1
  for plugin_name in a:plugin_list
    " call pathogen#interpose("bundle/" . plugin_name)
    call plug#(plugin_name)
  endfor
endfunction " }}}1

" - ctrlp - fuzzy finder.
" - delimitMate - automatic quotes/parenthesis closer.
" - Denite - a dark powered plugin for Neovim/Vim to unite all interfaces.
" - gundo - plugin to visualize your Vim undo tree.
" - matchit - The matchit.vim script allows you to configure % to match more than just single characters.
" - neosnippet - The Neosnippet plug-In adds snippet support to Vim.
" - nerdtree - The NERD tree allows you to explore your filesystem and to open files and directories.
" - quickfixsigns - Display signs (marks, changes, etc.)at interesting lines.
" - rainbow - help you read complex code by showing diff level of parentheses in diff color.
" - syntastic - syntax checking plugin.
" - tagbar - provides an easy way to browse the tags of the current file and get an overview of its structure.
" - undotree - visualize undo tree and increase working convenience with it.
" - vim-airline - Prettified Vim bottom status panel.
" - vim-airline-themes - visual themes for the vim-airline.
" - vim-coloresque - colors words/codes visualizer (`#00ff00` will be highlighted with a green color).
" - vimcommander - Total Commander like file manager.
" - vim-fugitive - Git-wrapper plugin.
" - vim-gitgutter - plugin which shows a git diff in the 'gutter' (sign column).  It shows whether each line has been added, modified, and where lines have been removed.
" - vim-signature - vim-signature is a plugin to place, toggle and display marks.
" - vim-signify - Signify uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS)._
" - vim-support - VimScript Support implements a VimScript-IDE for Vim/gVim/Neovim.
" - vim-surround - Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.  The plugin provides mappings to easily delete, change and add such surroundings in pairs.
" - vim-wordy - wordy is a lightweight tool to assist you in identifying those words and phrases known for their history of misuse, abuse, and overuse, at least according to usage experts.
" - webapi-vim - An Interface to WEB APIs.

call plug#begin("~/.vim/bundle")

" TODO:
" https://github.com/edkolev/tmuxline.vim
" https://github.com/jreybert/vimagit
" https://github.com/vim-ctrlspace/vim-ctrlspace
" https://github.com/mattn/vim-gist
" https://github.com/godlygeek/tabular
" https://github.com/mg979/vim-visual-multi
" https://github.com/tpope/vim-repeat
" https://github.com/tpope/vim-unimpaired
" https://github.com/qpkorr/vim-bufkill
" https://github.com/glts/vim-radical
" https://github.com/Raimondi/delimitMate
" https://github.com/justinmk/vim-sneak
" https://github.com/eugen0329/vim-esearch

" "https://github.com/lambdalisue/battery.vim/"
" https://github.com/cdelledonne/vim-cmake
" Plug 'https://github.com/sjl/gundo.vim'
" Plug 'https://github.com/lpenz/vimcommander.git'

" \	 "https://github.com/junegunn/indentLine",
" Veery slow: \    "https://github.com/gorodinskiy/vim-coloresque",

    call s:infect_plugins([
    \    "https://github.com/flazz/vim-colorschemes",
    \    "https://github.com/junegunn/seoul256.vim",
    \    "https://github.com/luochen1990/rainbow",
	\
    \    "https://github.com/airblade/vim-gitgutter",
    \    "https://github.com/bling/vim-bufferline",
    \    "https://github.com/chrisbra/matchit",
    \    "https://github.com/ctrlpvim/ctrlp.vim",
    \    "https://github.com/jacquesbh/vim-showmarks",
    \    "https://github.com/junegunn/gv.vim",
	\    "https://github.com/junegunn/vim-slash",
    \    "https://github.com/kshenoy/vim-signature",
    \    "https://github.com/majutsushi/tagbar",
    \    "https://github.com/mattn/webapi-vim",
    \    "https://github.com/mbbill/undotree",
    \    "https://github.com/mhinz/vim-signify",
    \    "https://github.com/mox-mox/vim-localsearch",
    \    "https://github.com/nathanaelkane/vim-indent-guides",
    \    "https://github.com/reedes/vim-wordy",
    \    "https://github.com/ryanoasis/vim-devicons",
    \    "https://github.com/scrooloose/syntastic.git",
    \    "https://github.com/sheerun/vim-polyglot",
    \    "https://github.com/Shougo/denite.nvim",
    \    "https://github.com/Shougo/neosnippet.vim",
    \    "https://github.com/Shougo/neosnippet-snippets",
    \    "https://github.com/tomtom/quickfixsigns_vim",
    \    "https://github.com/tpope/vim-fugitive",
    \    "https://github.com/tpope/vim-speeddating",
    \    "https://github.com/tpope/vim-surround",
    \    "https://github.com/vim-airline/vim-airline",
    \    "https://github.com/vim-airline/vim-airline-themes",
    \    "https://github.com/vim-scripts/LargeFile",
    \    "https://github.com/vim-scripts/taglist.vim",
	\
	\	 "~/.vim/bundle/a_baloons",
	\	 "~/.vim/bundle/a_colors",
	\	 "~/.vim/bundle/a_contexthelp",
	\	 "~/.vim/bundle/a_datetime",
	\	 "~/.vim/bundle/a_fontsize",
	\	 "~/.vim/bundle/a_hg_menu",
	\	 "~/.vim/bundle/a_lastcursorpos",
	\	 "~/.vim/bundle/a_mouse",
	\	 "~/.vim/bundle/a_spell",
	\	 "~/.vim/bundle/a_tabs",
	\	 "~/.vim/bundle/a_translation",
	\	 "~/.vim/bundle/a_yakuake",
    \ ])

    Plug 'https://github.com/scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }

	Plug 'https://github.com/chrisbra/csv.vim', { 'for': 'csv' }

    Plug 'https://github.com/WolfgangMehner/awk-support', { 'for': ['shell', 'awk'] }
    Plug 'https://github.com/WolfgangMehner/bash-support', { 'for': 'shell' }

    Plug 'https://github.com/WolfgangMehner/c-support', { 'for': ['c', 'cpp']}
	Plug '~/.vim/bundle/a_alternate', {'for': ['c', 'cpp']}
    Plug 'https://github.com/ilyachur/cmake4vim', { 'for': ['cmake', 'c', 'cpp'] }
    " Plug 'https://github.com/puremourning/vimspector', { 'for': ['c', 'cpp', 'lua', 'rust', 'python', 'tcl', 'go', 'php', 'java', 'javascript', 'typescript'] }
    " - errormarker - Highlights and sets error markers for lines with compile errors. C-support can do this too.
    " Plug 'https://github.com/mh21/errormarker.vim', {'for': ['c']}

    Plug 'https://github.com/junegunn/vim-cfr', {'for': 'java'}

    " - emmet - web developers abbreviations expander.
    Plug 'https://github.com/mattn/emmet-vim', {'for': ['php', 'html', 'css']}
    Plug 'https://github.com/hail2u/vim-css3-syntax.git', {'for': ['css', 'html', 'php']}
    Plug 'https://github.com/pangloss/vim-javascript', {'for': ['javascript', 'html']}
    Plug 'https://github.com/leafgarland/typescript-vim', {'for': ['typescript', 'typescriptreact']}
    " - PIV - php support.
    Plug 'https://github.com/spf13/PIV', {'for': 'php'}

	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }

    Plug 'https://github.com/lervag/vimtex', {'for': 'tex'}

    Plug 'https://github.com/WolfgangMehner/lua-support', {'for': 'lua'}

    Plug 'https://github.com/WolfgangMehner/matlab-support', {'for': 'matlab'}

    Plug 'https://github.com/WolfgangMehner/perl-support', {'for': 'perl'}

    Plug 'https://github.com/python-mode/python-mode', {'for': 'python'}
    " - vim-virtualenv - The virtualenv.vim plugin will modify python's sys.path and the $PATH environment variable
    " so that anything done with :python or :!python will behave like you would expect for the chosen virtualenv.
    Plug 'https://github.com/jmcantrell/vim-virtualenv', {'for': 'python'}

    Plug 'https://github.com/vim-scripts/Ada-Bundle', {'for': 'ada'}
    Plug 'https://github.com/thindil/vim-ada', {'for': 'ada'}

    Plug 'https://github.com/plasticboy/vim-markdown', {'for': 'markdown'}
    Plug 'https://github.com/junegunn/vim-markdown-toc', {'for': 'markdown'}
    " Plug 'https://github.com/WolfgangMehner/vim-support', {'for': 'vim'}

    Plug 'https://github.com/vim-utils/vim-man', {'for': 'man'}

    if s:is_it_first_run()
        PlugInstall
    endif

call plug#end()

if filereadable("/etc/vim/vimrc")
	source /etc/vim/vimrc
endif

"filetype plugin indent on

" Verbosity level for testing.
"set verbose=9

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
   finish
endif

if v:version < 700
   echoerr 'This vimrc requires Vim 7 or later.'
   quit
endif

if has('cmdline_info')
   set ruler                   " Show the ruler
   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
   set showcmd                 " Show partial commands in status line and
                               " Selected characters/lines in visual mode
endif

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

"
" Common text settings.{{{1
"

set tabstop=4
set shiftwidth=4
set smartindent

" Tab to spaces.
set expandtab

if has("filterpipe")
   " Use pipes on Unix.
   set noshelltemp
endif

" Assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" To avoid the 'Hit ENTER to continue' prompt.
set shortmess=aOItT

" Wrapping by word's borders.
set linebreak

" Wrapping symbols.
set showbreak=>>\ 

" Disable the beeping completely.
set noerrorbells
set belloff=all

" Show an error window when there are errors.
cwindow
"lwindow

" Displays tabs with :set list & displays when a line runs off-screen.
set listchars=tab:;_,eol:$,trail:_,precedes:<,extends:>


" Open next buffers in new tab.
" Jumps to first window or tab that contains specified buffer instead
" of duplicating an open window
set switchbuf=useopen
"set switchbuf=newtab
" Always show tabline
"set stal=2

" Support these file formats.
set fileformats=unix,dos,mac

" Encodings list for the auto-detection.
set fileencodings=ucs-bom,utf-8,cp1251,cp866,koi8-r,java,ucs-2le
" 1}}}


"
" Other.
"

" Tab support for 7.+ version
if has('windows')
	set guioptions+=e
	set switchbuf+=usetab
	set sessionoptions+=tabpages
endif

" Use forward slashes in file names; for Unix-like shells.
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" Don't say me, that file has changed since editing started.
set autoread

" Save files before performing certain actions.
"set autowrite


"
" Tags.{{{1
"

" list of file names to search for tags: Upward tag search
set tags+=./tags;/
" when completing tags in Insert mode show more info
set showfulltag
" use binary searching in tags files
set tagbsearch
" number of significant characters in a tag name or zero
"set taglength=0
" file names in a tags file are relative to the tags file
"set tagrelative
" a :tag command will use the tagstack
"set tagstack
" 1}}}


" Change buffer - without saving
" (don't unload a buffer when no longer shown in a window)
set hidden

" Extended regexps - use \v for very-magic.
set magic

" Prevent modelines in files from being evaluated (avoids a potential
" security problem wherein a malicious user could write a hazardous
" modeline into a file) (override default value of 5)
set modelines=2

set printoptions=paper:letter,number:y,syntax:n

" if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
" else
"   set backup    " keep a backup file
" endif

" Keep 250 lines of command line history.
set history=250

" Enable file type plugins and indentation rules.
filetype on
filetype plugin on
filetype plugin indent on

"
" Folding.{{{1
"

" Set to display all folds open.
set nofoldenable

" Folding type: 'manual', 'indent', 'expr', 'marker' or 'syntax'.
set foldmethod=marker

" Min folding level.
"   set foldlevel=0
" Value for 'foldlevel' when starting to edit a file.
"   set foldlevelstart=-1

" Close a fold when the cursor leaves it.
set foldclose=all

" Specifies for which commands a fold will be opened.
set foldopen=all

" Minimum number of screen lines for a fold to be closed.
set foldminlines=1

"if has('gui') " && winwidth(0) > 80
"	set foldcolumn=3	" width of the column used to indicate folds
"endif

" 1}}}

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.a,.exe,.info,.aux,.log,.out,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.obj,.COPYING,.pyc


" }}}1


"
" Section:  Commands. {{{1
"

if exists(":command")
   command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

   " Redir: Copy vim command output to the system clipboard.
   command! -nargs=+ -complete=command Redir
      \   redir @a
      \ | silent <args>
      \ | redir END
      \ | 20new [Scratch: <q-args>]
      \ | 1put! a
      \ | setlocal bh=delete bt=nofile nomod
      \ | wincmd p

   " Info:
   " Define Info cmd to source script file which redefine this one.
   "command! -nargs=* Info
   " \ delcommand Info |
   " \ runt scripts/Info.vim |
   " \ Info <args>

   " InsClip: insert clipboard as 1st item of the list in the buffer.
   " usage: gvim --remote-silent-tab +InsClip ~/.plan
   command! -bar InsClip 1/^\s*\*/|exe"norm!O\<C-R>*"|write

endif " exists(":command")

" 1}}}


" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" 1}}}


"
" Section: Plugin settings. {{{1
"

" Menus
if filereadable("$VIMRUNTIME/menu.vim")
    source $VIMRUNTIME/menu.vim
    set wildmenu cpo-=< wcm=<C-Z>
endif

" 1}}}

"Set mapleader to '\'
"let mapleader = "\\"
"let g:mapleader = "\\"

syntax on

let g:yakuake_plugin_enabled = 1
let g:did_ftplugin = 1

