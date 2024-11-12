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


XButton1::F11
XButton2::F12
