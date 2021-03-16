"
" Auto completion file for My Vim lib.
"


" Set the style of the popup menu on autocomplete.
" menu      - show menu.
" preview   - show extra information.
set completeopt=menu,preview

" Specifies how Insert mode completion works.
set complete=.,w,b,t,k,i

" List of flags that tell how automatic formatting works:
"    t = Auto-wrap text using textwidth (does not apply to comments)
"    c = Auto-wrap comments, inserting the comment leader
"    r = Insert the comment leader after hitting <Enter> in Insert mode.
"    o = Insert the comment leader after hitting 'o' or 'O' in Normal mode.
"    q = Allow formatting of comments with "gq".
"    n = Auto-listing
"    1 = Don't break a line after a one-letter word.
"    l = don't break long lines that were already there
set formatoptions-=t
set formatoptions=crqon1l

" Adjust case of a keyword completion match.
set infercase
" Show the matching bracket for the last ')'.
set showmatch
" Tenth of a second to show a match for 'showmatch' (def=5).
set matchtime=3
" Number formats recognized for CTRL-A and CTRL-X commands.
set nrformats=alpha,hex

set completeopt=longest,menu,preview

" List of dictionary files for keyword completion.
try
    if has("unix")
        set dictionary=~/.words,/usr/share/dict/*words
    else
        set dictionary=~/.words,c:/usr/share/dict/*.words
    endif
catch
endtry

"set dictionary=~/.vim/wordlists/c.list,~/.vim/wordlists/php.list
