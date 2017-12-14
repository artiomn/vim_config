"
" Binary formats.
"

augroup Binary
   au!
   " vim -b : edit binary using xxd-format!
   au BufReadPre     *.bin,*.exe,*.com,*.dll let &bin=1
   au BufReadPost    *.bin,*.exe,*.com,*.dll if &bin | %!xxd
   au BufReadPost    *.bin,*.exe,*.com,*.dll set ft=xxd | endif
   au BufWritePre    *.bin,*.exe,*.com,*.dll if &bin | %!xxd -r
   au BufWritePre    *.bin,*.exe,*.com,*.dll endif
   au BufWritePost   *.bin,*.exe,*.com,*.dll if &bin | %!xxd
   au BufWritePost   *.bin,*.exe,*.com,*.dll set nomod | endif
augroup END
