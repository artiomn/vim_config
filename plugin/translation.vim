"fun! VarExists(var, val)
"if exists(a:var) | return a:val | else | return '' | endif
"endf

fun! Translate(word)
   " !socrat <cWORD>
   exec "!dict " . shellescape(a:word)
endf
"---------------------------------------------------------------------------------
"function! TranslateWord()
"   let s:dict    = "$HOME/dict/mueller-base.sh"
"   let s:phrase  = expand("<cword>")
"   let s:tmpfile = tempname()
"   silent execute "!" . s:dict . " " . s:phrase . " > " . s:tmpfile
"   execute "botright sp " . s:tmpfile
"endf
"---------------------------------------------------------------------------------

" Translate with Google translator (with `wget -qO -` or `curl -so -`)
" Поганый гугл не пускает wget. Надо задавать User-Agent.

command! -nargs=1 Translate :call Translate(<args>)

map! <silent><Leader><F1>	:echo system('wget --user-agent="Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=vim&sl=en&tl=ru&text='.expand('<cword>').'"')<cr>
vmap <silent><Leader><F1>	y:echo system('wget --user-agent="Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=vim&sl=en&tl=ru&text='.substitute(@@,'\_s\+','+','g').'"')<cr>

map! <silent><Leader><C-F1>:echo system('wget --user-agent="Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=vim&sl=ru&tl=en&text='.expand('<cword>').'"')<cr>
vmap <silent><Leader><C-F1>y:echo system('wget --user-agent="Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=vim&sl=ru&tl=en&text='.substitute(@@,'\_s\+','+','g').'"')<cr>

