"
" Mercurial menu plugin.
"


" This is for hg menu.
if filereadable( "/usr/share/doc/mercurial/examples/hg-menu.vim" )
   let mapleader = ","
   source /usr/share/doc/mercurial/examples/hg-menu.vim
   let mapleader = "\\"
endif
