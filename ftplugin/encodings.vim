"
"
"


augroup ENCODINGS
   " To show lang name on the statusline
   au BufNewFile,BufRead	*	let b:keymap_name="RU"

   au FileType	jproperties nested Encoding java
   au FileType	mail        nested Encoding koi8-r
   au FileType	dosini      nested Encoding cp1251
augroup END

