augroup html
   au!
   "au BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<cr>
   "au BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<cr>
   "au BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<A?mg src="<++>" alt="<++>" />')<cr>
   "au BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<cr>
   "au BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<cr>
   "au BufRead,BufNewFile *.tmpl,*.js,*.htm inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><cr><++><cr></<++>>")<cr>

   " there are other key mappings that it's useful to have for typing HTML
   " character codes, but that are definitely not wanted in other files (unlike
   " the above, which won't do any harm), so only map these when entering an HTML
   " file and unmap them on leaving it:
   au FileType if &filetype == "html" | call FileType_HTML() | endif |
      \ compiler tidy
   au BufNewFile *.html,*.htm call HTML_template()

   au BufNewFile,BufRead *.html,*.htm so $VIMRUNTIME/indent/html.vim

   au FileType html set omnifunc=htmlcomplete#CompleteTags
   au FileType css set omnifunc=csscomplete#CompleteCSS
   au FileType xml set omnifunc=xmlcomplete#CompleteTags
augroup END

