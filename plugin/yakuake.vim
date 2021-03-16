"
" Yakuake console support.
"

let g:yakuake_plugin_enabled = get(g:, 'yakuake_plugin_enabled', 0)

if !executable("yakuake") || !executable("qdbus") || !g:yakuake_plugin_enabled
    finish
endif

function! YakuakeGetActiveTabId()
    return system("qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeTerminalId")
endfunction


function! YakuakeGetTabTitle(id)
    return system("qdbus org.kde.yakuake /yakuake/tabs org.kde.yakuake.tabTitle " . a:id)
endfunction


function! YakuakeSetTabTitle(id, title)
    call system("qdbus org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle " . a:id . " " . a:title)
endfunction


function! YakuakeShow()
    call system("qdbus org.kde.yakuake /yakuake/window org.kde.yakuake.show")
endfunction


function! YakuakeHide()
    call system("qdbus org.kde.yakuake /yakuake/MainWindow_1 org.qtproject.Qt.QWidget.hide")
endfunction


function! YakuakeToggle()
    call system("qdbus org.kde.yakuake /yakuake/window org.kde.yakuake.toggleWindowState")
endfunction


function! YakuakeUpdate()
    call system("qdbus org.kde.yakuake /yakuake/MainWindow_1 org.qtproject.Qt.QWidget.update")
endfunction


if has("unix")

   if exists(":command")
      command! -n=0 -bar Yakuake :call YakuakeOpen()
   endif

   augroup yakuake
         au!
         au VimEnter * let g:old_tab_title = YakuakeGetTabTitle(YakuakeGetActiveTabId())
         au BufEnter,BufRead,BufNewFile *
           \ call YakuakeSetTabTitle(YakuakeGetActiveTabId(), expand('%:t')) |
           \ call YakuakeUpdate()
         au VimLeave * call YakuakeSetTabTitle(YakuakeGetActiveTabId(), g:old_tab_title)
   augroup END
endif
