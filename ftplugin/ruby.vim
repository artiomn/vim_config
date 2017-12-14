" Ruby.

fun! Filetype_Ruby()
   " Make sure ruby files always get expanded 2-space tabs.
   set tabstop=2
   set expandtab
   let b:foldsearchprefix='\v^\s*(#.*)?$'
endf
"---------------------------------------------------------------------------------
fun! Ruby_template()
   append
#!/usr/bin/ruby

# ==============================================================================
#
# @FILE@
#
# Description: @DESC@
#
#
# @author @AUTHOR@ <@AUTHOREMAIL@>
# @date @DATE@
#
# ==============================================================================



# vim:set @MODELINE@

.

   call Template_Apply("ruby")
   call cursor(15, 1)
endf
"---------------------------------------------------------------------------------

augroup ruby
   au!
   au Filetype    ruby     call Filetype_Ruby()
   au FileType    ruby     compiler ruby
   au BufNewFile  *.rb     call Ruby_template()
augroup END

