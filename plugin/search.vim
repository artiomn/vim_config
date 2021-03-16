"
" Search-specific settings.
"

" Artiom N.

" Do incremental searching.
set incsearch

" Ignore case search.
set ignorecase

" Override 'ignorecase' if the search pattern contains upper case.
set smartcase

" v:version >= 700
set grepprg=internal

" Assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault
