"
" Spell checking from My Vim lib.
"

"
" Russian (with `yo`) and English combined spell checking.
"

if has('spell')
   set complete+=kspell

   " Where it should get the dictionary files.
   let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

   " Mark bad spelled words with red.
   highlight SpellErrors gui=underline ctermfg=Red guifg=Red

   " Automatic dictionaries loading.
"   let loaded_spellfile_plugin = 1
   "au SpellFileMissing * call Download_spell_file(expand('<amatch>'))

   "set spelllang=ru_yo,en_us,en_gb,en
   set spelllang=ru_yo,en_us,en_gb
   "set spellfile="~/.vim/spell/ru.utf-8.spl"
   "set spellfile=~/.vim/spell/ru_en.utf-8.add
   silent! set spell
"   setlocal nospell

   if &spell == 1
      hi SpellBad    cterm=underline ctermbg=none ctermfg=Red
      hi SpellCap    cterm=underline ctermbg=none
      hi SpellRare   cterm=underline ctermbg=none
      hi SpellLocal  cterm=underline ctermbg=none
   endif
endif


"
" External spellchecker.
"

" No built-in spelling.
fun! SpellChk(lang)
   try
      let l:cursor = line(".")
      "w!
      if a:lang == "-" && $SPELL_LANG == ""
         let $SPELL_LANG = "en"
       elseif a:lang != "-"
         let $SPELL_LANG = a:lang
      endif
      silent exec "!aspell -l ". expand("$SPELL_LANG") . " -c " . expand("%")
      if (v:shell_error == 0)
         " Delete in buffer, it's for 'u'.
         %d
         r %
         " Delete added blank string.
         1d
      endif
   catch /*/
      return 1
   endtry
   call cursor(l:cursor, 1)
   redraw!
endf

command! -nargs=* Spell call SpellChk(<args>)
command! Slr Spell("ru")
command! Sle Spell("en")

