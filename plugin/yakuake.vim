"
" Yakuake console support.
"

finish

function! YakuakeGetActiveTabId()
	return system("qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeTerminalId")
endfunction


function! YakuakeSetTabTitle(id, title)
    call system("qdbus org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle " . a:id . " " . a:title)
endfunction


function! YakuakeOpen()

endfunction


function! YakuakeUpdate()
endfunction


function! YakuakeRestore()
endfunction


if has("unix")

   if exists(":command")
      command! -n=0 -bar Yakuake :call YakuakeOpen()
   fi

   augroup yakuake
         au!
         au VimEnter * let session_id = YakuakeGetActiveTabId() | call YakuakeSetTabTitle(session_id, "sssssssss")
         au BufEnter,BufRead,BufNewFile * call YakuakeUpdate()
         au VimLeave * call YakuakeRestore()
      augroup END
   endif
endif
