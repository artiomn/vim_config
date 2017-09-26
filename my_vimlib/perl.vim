" Perl.

fun! Filetype_Perl()
   if exists("b:did_ftplugin") | return | endif
   let b:did_ftplugin = 1

   setlocal textwidth=78
   setlocal expandtab
   setlocal tabstop=4
   setlocal shiftwidth=4
   setlocal cindent
   setlocal cinkeys=0{,0},0),:,!^F,o,O,e
   " set smartindent

   " Set formatoptions to break comment lines but not other lines,
   " and insert the comment leader when hitting <CR> or using "o".
   " Also you can do "gq}" on a comment to format until the end
   " of the paragraph.

   setlocal fo-=t fo+=croql
   setlocal comments=:#
   setlocal define=[^A-Za-z_]

   setlocal iskeyword=48-57,_,A-Z,a-z,:
   setlocal keywordprg=perlinfo

   setlocal filetype=perl

   " setlocal makeprg=perl\ -Mstrict\ -wc\ %
   " setlocal errorformat+=%m\ at\ %f\ line\ %l

   setlocal makeprg=$VIMRUNTIME/tools/efm_perl.pl\ -c\ %\ $*
   setlocal errorformat=%f:%l:%m

   " Set this once, globally
   if !exists("perlpath")
      if &shellxquote != '"'
         let perlpath = system('perl -e "print join(q/,/,@INC)"')
      else
         let perlpath = system("perl -e 'print join(q/,/,@INC)'")
      endif
      let perlpath = substitute(perlpath, ',.$',',,','')
   endif

   let &l:path=perlpath
endf
"---------------------------------------------------------------------------------
fun! Perl_template()
endf
"---------------------------------------------------------------------------------
fun! Perl_UsePackage()
    let default = expand("<cword>")
    call inputsave()
    let module = input("Module (default " . default . "): ")
    call inputrestore()
    if module == ""
        let module = default
    endif
    normal mz
    normal G$
    call search("^use ", "b")
    call append(line("."), "use " . module . ";")
    normal `z
endf
"---------------------------------------------------------------------------------

