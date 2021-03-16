" Standard vim manpage reader plugin
"runtime ftplugin/man.vim

au!
au BufReadPost * set ro
au BufReadPost * call man#get_page('horizontal', expand('%:p'))

