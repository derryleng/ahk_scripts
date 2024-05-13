#Requires AutoHotkey v2.0-rc.2 64-bit
#SingleInstance Force

WinHide "ahk_class Shell_TrayWnd"

closeCurrentDesktop() {
    Send "#^{F4}"
}

newDesktop() {
    Send "#^d"
}

nextDesktop() {
    Send "#^{Right}"
}

prevDesktop() {
    Send "#^{Left}"
}

; Switch to next/previous desktop
#e::nextDesktop()
#q::prevDesktop()

#d::newDesktop() ; Open new desktop
#+d::closeCurrentDesktop() ; Close current desktop

#+c::WinClose "A"

#f::Run "firefox"
#+f::Run '"firefox" "-private-window"'

#Enter::Run "taskmgr"
#+Enter::Run "wt"

#t::
{
	WinHide "ahk_class Shell_TrayWnd"
}

#+t::
{
	WinShow "ahk_class Shell_TrayWnd"
}
