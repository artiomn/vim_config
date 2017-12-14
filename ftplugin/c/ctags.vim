"
" Vim ctags plugin.
"


" Ctags {
    set tags=./tags;/,~/.vimtags

    " Make tags placed in .git/tags file available in all levels of a repository
    let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
    if gitroot != ''
        let &tags = &tags . ',' . gitroot . '/.git/tags'
    endif

    menu Tags.create :!ctags --recurse --language-force=c --extra=+q --fields=+i *.c *.h<CR>
" }

