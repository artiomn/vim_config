" Shell.

fun! Filetype_Shell()
endf


fun! Shell_template()
   append
#!/bin/sh

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

   call Template_Apply("sh")
   call cursor(15, 1)
endf


augroup shell
   au!
   au Filetype    shell call Filetype_Shell()
   au BufNewFile  *.sh  call Shell_template()

   au FileType sh       compiler bash
   au FileType awk      compiler awk
   au FileType csh,tcsh compiler csh
   au FileType zsh      compiler zsh
augroup END

