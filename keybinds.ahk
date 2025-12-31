; Made by Revinder
; twitter.com/Revinder_
; 2020

#Requires AutoHotkey v2.0
#SingleInstance Force

Global TIBIA_EXE := "ahk_exe Tibia.exe" 
Global wasEnabled := True


; ====== "GUI" aka red dot initialization
; Simple dot indication of script being enabled
Global StatusGui := Gui()
DrawGui()

; ====== Toggling on/off
#HotIf WinActive(TIBIA_EXE)
`::
{
    Global wasEnabled
    wasEnabled := !wasEnabled
    UpdateColor()
}
#HotIf

UpdateColor() {
    Global wasEnabled
    If wasEnabled {
        StatusGui.BackColor := "Green"
    }
    Else {
        StatusGui.BackColor := "Red"
    }
}

DrawGui() {
    Global StatusGui
    gWidth  := 35
    gHeight := 35
    gX      := 280
    gY      := 880

    StatusGui.BackColor := "Green"
    StatusGui.Opt("-Caption +ToolWindow +AlwaysOnTop")
    StatusGui.Show("x" gX " y" gY " w" gWidth " h" gHeight " NoActivate")

    ; Drawing circle
    WinSetRegion("0-0 w" gWidth " h" gHeight " E", StatusGui.Hwnd)
}

#HotIf wasEnabled AND WinActive(TIBIA_EXE)
; ====== Movement
w::Up
a::Left
s::Down
d::Right
; ====== Diagonal movement with QEZC
q::NumpadHome
e::NumpadPgUp
z::NumpadEnd
c::NumpadPgDn

; ====== HotKeys
; Works with additonal mods [shift, ctrl, alt]
r::F1
f::F2
v::F4
1::F5
2::F6
3::F3
4::F12
x::F7
t::F8
b::F9
XButton1::Enter
XButton2::F10
5::F11

#HotIf
