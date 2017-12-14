"
" Filetype plugin for .vimrc.
"


" Define and reset augroup used in vimrc.
augroup vimrc
	au!
	" Show quickfix automatically.
	" Reference: http://webtech-walker.com/archive/2009/09/29213156.html
	au vimrc QuickfixCmdPost make,grep,grepadd,vimgrep
		\ if len(getqflist()) != 0 | copen | endif

	" Auto reloading vimrc.
	" Reference: http://vim-users.jp/2009/09/hack74/
	if has('gui_running')
		au vimrc BufWritePost .vimrc,_vimrc,vimrc
			\ source $MYVIMRC
		au vimrc BufWritePost .gvimrc,_gvimrc,gvimrc
			\ source $MYGVIMR
	else
		au vimrc BufWritePost .vimrc,_vimrc,vimrc
			\ source $MYVIMRC
	endif
augroup END

