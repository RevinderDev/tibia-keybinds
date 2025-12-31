; Made by Revinder (Updated by Gemini)
; twitter.com/Revinder_
; 2024

; TODO: This probably requires remaking it for v2.
; ====== Settings
#NoEnv                       ; Blocks checking ENV variables
SendMode Input               ; Sets mode to input events only

; ====== Global Variables for Timers
global TimerFuncs := {} 
global TimeLeft := {}

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

~+y::StartTimer("Potion", 60*10, 2, 880)
~+3::StartTimer("Utura", 60, 4, 980)
~2::
~3::
    StartTimer("Stance", 10, 3, 930)


StartTimer(TextLabel, Duration, GuiID, YPos) {
    ; 1. Stop existing timer for this ID if running
    if (TimerFuncs[GuiID]) {
        fn := TimerFuncs[GuiID]
        SetTimer, %fn%, Off
    }

    ; 2. Set starting time
    TimeLeft[GuiID] := Duration

    ; 3. Setup the GUI
    Gui, %GuiID%:Destroy
    Gui, %GuiID%:+AlwaysOnTop -Caption +ToolWindow +LastFound +Owner
    Gui, %GuiID%:Color, 111111
    Gui, %GuiID%:Font, s20 cWhite Bold, Verdana
    
    ; FIXED: Removed "vTextControl". We will target "Static1" instead.
    Gui, %GuiID%:Add, Text, Center w300, %TextLabel%: %Duration%s 
    
    ; Transparency
    WinSet, TransColor, 111111 255
    
    ; Show at specific Y position
    Gui, %GuiID%:Show, x250 y%YPos% NoActivate

    ; 4. Create Bound Function for the timer
    fn := Func("UpdateTick").Bind(GuiID, TextLabel)
    TimerFuncs[GuiID] := fn 
    
    ; Start timer (1000ms)
    SetTimer, %fn%, 1000
}

UpdateTick(GuiID, TextLabel) {
    TimeLeft[GuiID] := TimeLeft[GuiID] - 1
    currTime := TimeLeft[GuiID]

    if (currTime <= 0) {
        Gui, %GuiID%:Destroy
        fn := TimerFuncs[GuiID]
        SetTimer, %fn%, Off
    } else {
        ; FIXED: Updates "Static1" (the first text control) on the specific GUI
        GuiControl, %GuiID%:, Static1, %TextLabel%: %currTime%s
    }
}

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
