augroup gpg
   au BufReadPre,FileReadPre   *.gpg set viminfo=
   au BufReadPre,FileReadPre   *.gpg set noswapfile
   au BufReadPost              *.gpg :%!gpg -q -d
   au BufReadPost              *.gpg | redraw
   au BufWritePre              *.gpg :%!gpg --default-recipient-self -q -e -a
   au BufWritePost             *.gpg u
   au VimLeave                 *.gpg :!clear
   " For OpenSSL:
   " BufReadPost: use "openssl bf -d -a"
   " BufWritePre: use "openssl bf -salt -a"
augroup END

