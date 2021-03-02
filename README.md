## Tibia key binds remapped in AHK
Contains main script that I use to play tibia. It remaps whole terrible set of Tibia key bindings
(F1-F12) as well as movement from NumPad to mmo-like mappings. This repository will also contain 
my spell mappings to classes that I played (obviously changing between Tibia versions). Shows
visual indication whether or not script is running so you don't accidentally UE in thais.

It is worth noting that this functionality was already introduced in newest Tibia clients, however
this setup can be used on "older" setups ;).

## Running

Needs [Autohotkey](https://www.autohotkey.com/) to run. Once installed, just
run `script.ahk` in it.

## Mapping 
Keybind map

### Toggling
Toggles script on/off. Green color - script running, red color - script is off.
``````
` ::Suspend
ctrl + k ::Suspend
``````

### Movement   
``````
w::Up
a::Left
s::Down
d::Right
-- Diagonal --
q::NumpadHome
e::NumpadPgUp
z::NumpadEnd
c::NumpadPgDn
``````

### Keybinds
By default they will work with any modifiers (shift, ctrl, alt).
``````
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
XButton1::Enter  -- Mouse button 4
XButton2::F10    -- Mouse button 5 
5::F11
``````
