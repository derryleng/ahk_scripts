#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#KeyHistory 0 ; Ensures user privacy when debugging is not needed
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

closeCurrentDesktop() {
    Send #^{F4}
}

newDesktop() {
    Send #^d
}

nextDesktop() {
    Send #^{Right}
}

prevDesktop() {
    Send #^{Left}
}

; Switch to next/previous desktop
#e::nextDesktop()
#q::prevDesktop()

#d::newDesktop() ; Open new desktop
#+d::closeCurrentDesktop() ; Close current desktop

#w::WinClose, A

#f::Run, firefox
#+f::Run, "firefox" "-private-window"

#Enter::Run, taskmgr
#+Enter::Run, wt

; debugPrint() {
;     MsgBox % "Desktop - Count: " . desktopCount . " Current: " . desktopCurrent
; }
; #+r::debugPrint()
