"
" Yakuake console support.
"

""" Functions.{{{1
let g:yakuake_plugin_enabled = get(g:, "yakuake_plugin_enabled", 0)
let s:cmd = "qdbus "

" "dbus-send --print-reply=literal --type=method_call --dest="

if !executable("yakuake") || !executable("qdbus") || !g:yakuake_plugin_enabled
    finish
endif

function! yakuake#GetActiveTabId()
    return substitute(system(s:cmd . "org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeTerminalId"), '[\n\r]\+$', '', '')
endfunction


function! yakuake#Update()
    call system(s:cmd . "org.kde.yakuake /yakuake/MainWindow_1 org.qtproject.Qt.QWidget.update")
endfunction

function! yakuake#GetTabTitle(id)
    return substitute(system(s:cmd . "org.kde.yakuake /yakuake/tabs org.kde.yakuake.tabTitle " . a:id),
                             \ '[\n\r]\+$', '', '')
endfunction


function! yakuake#GetOldTabTitle()
    let g:yakuake#old_tab_title = yakuake#GetTabTitle(yakuake#GetActiveTabId())
    return g:yakuake#old_tab_title
endfunction


function! yakuake#RestoreOldTabTitle()
	call yakuake#SetTabTitle(yakuake#GetActiveTabId(), g:yakuake#old_tab_title)
endfunction


function! yakuake#SetTabTitle(id, title)
    call system(s:cmd . "org.kde.yakuake /yakuake/tabs org.kde.yakuake.setTabTitle " . a:id . " \"" . a:title . "\"")
	call yakuake#Update()
endfunction


function! yakuake#Show()
    call system(s:cmd . "org.kde.yakuake /yakuake/window org.kde.yakuake.show")
endfunction


function! yakuake#Hide()
    call system(s:cmd . "org.kde.yakuake /yakuake/MainWindow_1 org.qtproject.Qt.QWidget.hide")
endfunction


function! yakuake#Toggle()
    call system(s:cmd . "org.kde.yakuake /yakuake/window org.kde.yakuake.toggleWindowState")
endfunction

""" 1}}}

" Autocommands.{{{1
if has("unix")

   if exists(":command")
      command! -n=0 -bar Yakuake :call yakuake#Open()
   endif

   silent call yakuake#GetOldTabTitle()

   augroup yakuake
         au!
         au VimEnter * silent call yakuake#SetTabTitle(yakuake#GetActiveTabId(), expand('%:t'))
         au VimLeave * silent call yakuake#RestoreOldTabTitle()

         au BufEnter,BufReadPost,BufWritePost *
           \ silent call yakuake#SetTabTitle(yakuake#GetActiveTabId(), expand('%:t'))
		 au BufNewFile * silent call yakuake#SetTabTitle(yakuake#GetActiveTabId(), "New")
   augroup END

endif
" 1}}}

