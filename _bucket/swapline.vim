"---------------------------------------------------------------------------------
fun! SwapLine(dir)
   let l:pos = getpos(".")
   silent exec "move " . a:dir
   call setpos(".", l:pos)
endf

" Line swapping.
nmap <silent> gl :call SwapLine("+1")<CR>
nmap <silent> gL :call SwapLine("-2")<CR>

