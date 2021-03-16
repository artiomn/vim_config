augroup ENCODINGS
   " To show lang name on the statusline
   au BufNewFile,BufRead	*	let b:keymap_name="RU"
   au FileType	dosini      nested Encoding cp1251
augroup END

