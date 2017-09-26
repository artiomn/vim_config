"
" OS Windows settings.
"

" Artiom N.

if has("win32") || has("win16") || has("win64")
   " Doesn't need to include.
   " source $VIMRUNTIME/mswin.vim
   " Устанавливаю поведение, как в Linux Vim.
   behave xterm " mswin
   language ctype Russian_Russia.1251
   if $SHELL != ''
      set termencoding=cp866
   endif
   " Чтобы работало контекстное меню.
   "set mousemodel=popup

   " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
   " across (heterogeneous) systems easier. 
   set runtimepath=$VIM,$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,~/vimfiles
   " Make arrow and other keys work.
   "set term=$TERM

   " Better unix / windows compatibility.
   set viewoptions=folds,options,cursor,unix,slash

   " turns out I do like is sharing windows clipboard
   set clipboard+=unnamed

   " Help: <F1>
   noremap <M-F1>	:emenu Help.English-Russian<CR>

"   let wget = 
   " backspace in Visual mode deletes selection
   vnoremap <BS> d

   " CTRL-X and SHIFT-Del are Cut
   vnoremap <C-X> "+x
   vnoremap <S-Del> "+x

   " CTRL-C and CTRL-Insert are Copy
   vnoremap <C-C> "+y
   vnoremap <C-Insert> "+y

   " CTRL-V and SHIFT-Insert are Paste
   map <C-V>		"+gP
   map <S-Insert>		"+gP

   cmap <C-V>		<C-R>+
   cmap <S-Insert>		<C-R>+

   " Make the GnuWin32 binaries available to Vim (more Unix-like)
   let $PATH='C:\Program Files\GetGnuWin32\gnuwin32\bin;'.$PATH

   " command Sh		:call system('RunDll32.exe shell32.dll,ShellExec_RunDLL "'.iconv(expand(<q-args>),&enc,'cp866').'"')
   command! -nargs=* Sh	:exe 'silent !start' 'RunDll32.exe shell32.dll,ShellExec_RunDLL "'.iconv(expand(<q-args>),&enc,'cp1251').'"'

   nmap	<silent>gx	:silent !start RunDll32.exe shell32.dll,ShellExec_RunDLL "<cfile>"<CR>
   vmap	<silent>gx	y:silent !start RunDll32.exe shell32.dll,ShellExec_RunDLL "<C-R>""<CR>
   " nmap	<silent>gX	:silent !start RunDll32.exe shell32.dll,ShellExec_RunDLL "%:p"<CR>
   " nmap	<silent>gX	:call system('RunDll32.exe shell32.dll,ShellExec_RunDLL "'.iconv(expand('%:p'),&enc,'cp866').'"')<CR>
   map	<silent>gX	:exe 'silent !start' 'RunDll32.exe shell32.dll,ShellExec_RunDLL "' . iconv(expand('%:p'),&enc,'cp1251') . '"'<CR>

   map	<silent><C-F10>	gX

   "map	<M-F12>		:silent!!start c:/opt/far/far.exe /i /c %:p:h:gs?/?\\?<CR>

   " Copy current file name to clipboard
   nnoremap	<M-C-Insert>	:let @*=expand('%:p')<CR>
   nnoremap	<M-S-Insert>	:if filereadable(fnamemodify(@*,':gs?"??'))<BAR>tabedit <C-R>=fnamemodify(@*,':gs?"??')<CR><BAR>endif<CR>
   " nnoremap	<M-S-Insert>	:if tabedit <C-R>*<CR>

   if executable('NirCmd.exe')
   """ Jump to regkey in the RegEdit via NirCmd
   "map	<silent>gy	:silent!!start NirCmd.exe regedit <cfile>:s?^\[\|]$??:s?^-??<CR>

   """ Make link to the current file on the desktop
   map	<silent><M-F6>	:silent!!start NirCmd.exe shortcut "%:p" "~$folder.desktop$" "%:p:t:r"<CR>
   """ Make link to the current session on the desktop
   map	<silent><S-F6>	:if strlen(v:this_session)
      \ <BAR> exe ':silent!!start NirCmd.exe shortcut "'.v:this_session'" "~$folder.desktop$\Projects" '.fnamemodify(v:this_session,':p:h:t:r')
      \ <BAR> else <BAR> echoerr "No session!!" <BAR> endif<CR>

   endif

   " WinHelp: Invoke Windows help.
	command! -nargs=1 -complete=file WinHelp
		\ call libcallnr(expand('~/.vim/etc/wvimhlp.dll',1), 'winhelp',
		\ <q-args> . '|' . iconv(expand('<cword>'), &enc, 'cp1251'))

   " Far: invoke far manager.
   command! -nargs=0 -bar Far :silent!!start c:/opt/far/far.exe -i %:p:h


   " Be nice and check for multi_byte even if the config requires
   " multi_byte support most of the time
   if has("multi_byte")
      " Windows cmd.exe still uses cp850. If Windows ever moved to
      " Powershell as the primary terminal, this would be utf-8
      " 866 - cyrillic codepage.
      set termencoding=cp866
      " Let Vim use utf-8 internally, because many scripts require this
      set encoding=utf-8
      setglobal fileencoding=utf-8
      " Windows has traditionally used cp1252, so it's probably wise to
      " fallback into cp1252 instead of eg. iso-8859-15.
      " Newer Windows files might contain utf-8 or utf-16 LE so we might
      " want to try them first.
      set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
   endif

   if has("gui_running")
      " Отображение кириллицы во внутренних сообщениях программы.
      lan mes ru_RU.UTF-8

      " Отображение кириллицы в меню
      source $VIMRUNTIME/delmenu.vim
      set langmenu=ru_RU.UTF-8
      source $VIMRUNTIME/menu.vim
      "set guifont=Monospace\ 12
      " set guifont=Andale_Mono:h8:cRUSSIAN
      " set guifont=Lucida_Console:h10:cRUSSIAN
      " set guifont=Lucida_Sans_Typewriter:h8:cRUSSIAN
      " set guifont=Courier_New:h10:cDEFAULT
      " set guifont=Liberation_Mono:h10:cRUSSIAN
      " set guifont=DejaVu_Sans_Mono:h10:cRUSSIAN lines=999 columns=100

      " VimTip414: межстрочный интервал в gvim можно уменьшать:
      set guifont=Consolas:h11:cRUSSIAN lsp=-1 lines=999 columns=100
      " set guifont=Droid_Sans_Mono:h10:cRUSSIAN lsp=0 lines=999 columns=100
      " set columns=100
      let g:browsefilter =
         \ "All Files (*.*)\t*.*\n"
         \."Config Files (*.ini *.cfg *.rc)\t*.ini;*.cfg;*.rc\n"
         \."C/C++ Source Files (*.c *.cpp *.h *.hpp)\t*.c;*.cpp;*.c++;*.h;*hpp\n"
         \."Java Source Files (*.java *.properties)\t*.java;*.properties\n"
         \."Batch Files (*.bat *.cmd)\t*.bat;*.cmd\n"
         \."Perl Scripts (*.pl *.pm)\t*.pl;*.pm\n"
         \."HTML Files (*.htm *.html *.jsp *.css)\t*.htm;*.html;*.jsp;*.css\n"
         \."Vim scripts (*.vim .vimrc)\t*.vim;.vimrc;.gvimrc;_vimrc;_gvimrc;\n"

   endif


endif

