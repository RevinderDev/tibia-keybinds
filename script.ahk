; Made by Revinder
; twitter.com/Revinder_
; 2020

; ====== Settings
#NoEnv                       ; Blocks checking ENV variables
SendMode Input               ; Sets mode to input events only (mouse, clicks etc.)
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



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
return

; Alternate suspending
^k::Suspend

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
