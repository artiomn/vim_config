"
" Encodings: i18n & l10n.
"

" File Encoding switching.
fun! s:FEncNext()
   let b:encstring = (!exists("b:encstring")) ?
      \ substitute(&fencs, ',', ' ', 'g') : b:encstring

   if &fenc=='' | let &l:fenc=&enc | return | endif
      " Place current fenc to the end of the string.
   let b:encstring = substitute(b:encstring, '^\v(.*<'. &fenc .'>)\s+(.*)$', '\2 \1', '')
   let nenc = substitute(b:encstring, '^\v\s*(\S+).+', '\1', '')

   if expand('%') == ''
      let &l:fenc=nenc
   else
      silent exec 'vi ++enc=' . nenc
   endif
endf
"---------------------------------------------------------------------------------
fun! Auto_recode()
   w!
   split

   if has('unix')
      let s:enconv = "enconv"
   elseif has('win32')
      let s:path = expand('<sfile>:p')
      let s:enconv = s:path . "/bin/enconv.exe"
   endif

   exec 'read ' '!' . s:enconv . " -L russian - < " % " 2>/dev/null"
   " !xcode % > %.recode

endf
"---------------------------------------------------------------------------------
" Encoding: Change file encoding.
command! Recode call Auto_recode()
command! -nargs=1 -bar Encoding if &fenc!=<q-args> | visual ++enc=<args> | endif

