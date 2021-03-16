augroup ENCODINGS
   " To show lang name on the statusline
   au BufNewFile,BufRead	*	let b:keymap_name="RU"

   au FileType	mail        nested Encoding koi8-r
augroup END

