
augroup BinDocs
   au!
   " Просмотр нетекстовых файлов в Vim.
   " enable reading of doc, pdf, ps and odt in vim based on extension.
   au BufReadPre  *.pdf set ro
   au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw79
   "au BufReadPre  *.ps  set ro
   "au BufReadPost *.ps  silent %!pdftotext -nopgbrk "%" - |fmt -csw79
   au BufReadPre  *.doc set ro
   au BufReadPost *.doc silent %!wvWare -1 -x /usr/share/wv/wvText.xml "%" |fmt -csw79
   au BufReadPre  *.odt set ro
   au BufReadPost *.odt silent %!wvWare -1 -x /usr/share/wv/wvText.xml "%" |fmt -csw79
   "au BufReadPost *.odt silent %!odt2txt "%"
   "au BufReadPost *.rtf silent %!wvWare -1 -x /usr/share/wv/wvText.xml "%"
augroup END

