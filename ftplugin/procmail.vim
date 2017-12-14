" Procmail.
command! -nargs=+ NR call ProcmailRule(<f-args>)

fun! Procmail_Rule(where, to)
python << EOF
template = ''':0
* ^(To|CC): .*%s.*
%s/
'''

import vim
where = vim.eval("a:where")
where = where.replace(".", "\\.")
to = vim.eval("a:to")

vim.current.range.append((template % (where, to)).split("\n"))
EOF
endf

