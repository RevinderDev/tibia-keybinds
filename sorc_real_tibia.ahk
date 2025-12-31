; Made by Revinder (Updated by Gemini)
; twitter.com/Revinder_
; 2024

; TODO: This probably requires remaking it for v2.
; ====== Settings
#NoEnv                       ; Blocks checking ENV variables
SendMode Input               ; Sets mode to input events only

; ====== "GUI 1" aka red dot initialization
size:="W35 H35"
position:="X280 Y880"
Gui, 1:Color, Green
Gui, 1:-Caption +Toolwindow +AlwaysOnTop +LastFound
Gui, 1:Show, %position% %size% NA
WinSet, Region, 0-0 %size% E
return

; ====== Toggling on/off
`::
suspend, toggle
if (A_IsSuspended)
    Gui, 1:Color,Red
Else
    Gui, 1:Color,Green
SendInput {NumpadAdd Down}
Random, rand, 30.0, 60.0
sleep, rand
SendInput {NumpadAdd Up}
return

; ====== Existing Mouse Binds ======

WheelUp::
    SendInput {F9 Down}
    Random, rand, 30.0, 60.0
    sleep, rand
    SendInput {F9 Up}
return

WheelDown::
    SendInput {F10 Down}
    Random, rand, 30.0, 60.0
    sleep, rand
    SendInput {F10 Up}
return

XButton1::F11
XButton2::F12
