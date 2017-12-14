" PHP.

fun! Filetype_PHP()
   " PHP editing.
   " SQL Highlighting in Strings.
   let php_sql_query   = 1
   " Fold all { } regions.
   let php_folding     = 0
endf
"---------------------------------------------------------------------------------
fun! PHP_template()
   append
<?php
/**
 * @FILE@
 *
 * @DESC@
 *
 * @author @AUTHOR@ <@AUTHOREMAIL@>
 * @date @DATE@
 */



/* vim:set @MODELINE@ */
.
   call Template_Apply("php")
   call cursor(11, 1)
endf


augroup php
   au!
   au Filetype php call Filetype_PHP()
   au BufNewFile *.php call PHP_template()
augroup END

