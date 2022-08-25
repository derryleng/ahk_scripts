#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#KeyHistory 0 ; Ensures user privacy when debugging is not needed
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global desktopCount := 1
global desktopMax := 9
global desktopCurrent := 1

closeAllDesktops() {
    loop, 10 {
        Send #^{F4}
    }
    desktopCount = 1
    desktopCurrent = 1
}

closeCurrentDesktop() {
    if (desktopCurrent > 1) {
        desktopCount--
        desktopCurrent--
    }
    Send #^{F4}
}

openDesktops(desktopNum) {
    loop, desktopNum {
        Send #^d
    }
}

nextDesktop() {
    if (desktopCurrent < desktopMax) {
        if (desktopCurrent + 1 > desktopCount) {
            SendInput #^d
            desktopCount++
        }
        Send #^{Right}
        desktopCurrent++
    }
}

prevDesktop() {
    if (desktopCurrent > 1) {
        Send #^{Left}
        desktopCurrent--
    }
}

switchDesktopTarget(desktopTarget) {
    while (desktopCurrent >= 1 && desktopCurrent <= desktopMax) {
        if (desktopCurrent < desktopTarget) {
            if (desktopCurrent + 1 > desktopCount) {
                SendInput #^d
                desktopCount++
            }
            Send #^{Right}
            desktopCurrent++
        } else if (desktopCurrent > desktopTarget) {
            Send #^{Left}
            desktopCurrent--
        } else {
            break
        }
    }
}

closeAllDesktops()

; Switch to next/previous desktop
#e::nextDesktop()
#q::prevDesktop()

; Switch desktop by number
#1::switchDesktopTarget(1)
#2::switchDesktopTarget(2)
#3::switchDesktopTarget(3)
#4::switchDesktopTarget(4)
#5::switchDesktopTarget(5)
#6::switchDesktopTarget(6)
#7::switchDesktopTarget(7)
#8::switchDesktopTarget(8)
#9::switchDesktopTarget(9)

#d::closeCurrentDesktop() ; Close current desktop
#+d::closeAllDesktops() ; Close all desktops

#w::WinClose, A

#f::Run, firefox
#+f::Run, "firefox" "-private-window"

#Enter::Run, taskmgr
#+Enter::Run, wt

; debugPrint() {
;     MsgBox % "Desktop - Count: " . desktopCount . " Current: " . desktopCurrent
; }
; #+r::debugPrint()
