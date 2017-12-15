"
" Date/Time.
"

" Artiom N.

fun! CurDate()
   return(strftime("%d.%m.%Y"))
endf


fun! CurTime()
   return(strftime("%H:%M:%S"))
endf


fun! CurDateTime()
   return(CurDate()." ".CurTime()." ".strftime("%Z"))
endf


fun! CurDateTimeLine()
   return(strftime("%a %b %d %Y, ").CurTime().strftime(" %Z"))
endf


fun! FileTime()
   let ext        = tolower(expand("%:e"))
   let fname      = tolower(expand('%<'))
   let filename   = fname . '.' . ext
   let msg        = ""
   let msg        = msg." ".strftime("(Modified %b, %d %Y %H:%M:%S)", getftime(filename))
   return msg
endf


command! Date call append('.', CurDateTimeLine())
nmap <silent><F8> :Date<CR>
vmap <silent><F8> <ESC>:Date<CR>
imap <silent><F8> <ESC>:Date<CR>

