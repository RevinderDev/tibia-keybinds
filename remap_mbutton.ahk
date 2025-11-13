; Made by Revinder
; twitter.com/Revinder_
; 2024


; ====== Settings
#NoEnv                       ; Blocks checking ENV variables
SendMode Input               ; Sets mode to input events only (mouse, clicks etc.)

; ====== "GUI" aka red dot initialization
; Simple red dot indication of script being enabled
size:="W35 H35"
position:="X280 Y880"
Gui, Color, Green
Gui, -Caption +Toolwindow +AlwaysOnTop +LastFound
Gui, Show, %position% %size% NA
WinSet, Region, 0-0 %size% E
return



; ====== Toggling on/off
`::
suspend, toggle
if (A_IsSuspended)
    Gui,Color,Red
Else
    Gui,Color,Green
SendInput {NumpadAdd Down}
Random, rand, 30.0, 60.0
sleep, rand
SendInput {NumpadAdd Up}
return



; ====== Keybinds

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
