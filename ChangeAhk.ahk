global varijabla := "#{1}"
global broj := 0
; definisanje globaln varijable
funkcija1(){
varijabla :="#{1}"
;dodeljivanje vrednosti varijable
}
funkcija2(){
varijabla := "#{2}"
}
funkcija3(){
varijabla := "#{3}"
}
funkcija4(){
varijabla := "#{4}"
}

;q::
;msgbox %broj%
;return

F7 & e::
broj++
if(broj>4){
	broj:=1
}
if(broj == 1)
{
Send #{1}
}
else if(broj == 2)
{
Send #{2}
}
else if(broj == 3)
{
Send #{3}
}
else if(broj == 4){
Send #{4}
}
return


F7  & d::
broj--
if(broj<1){
	broj:=4
}
if(broj == 1)
{
Send #{1}
}
else if(broj == 2)
{
Send #{2}
}
else if(broj == 3)
{
Send #{3}
}
else if(broj == 4){
Send #{4}
}
return


F7 & 1::
broj:=1
Send #{1}
funkcija1()
return 


F7 & 2::
broj:=2
Send #{2}
funkcija2()
return 


F7 & 3::
broj:=3
Send #{3}
funkcija3()
return 

F7 & 4::
broj:=4
Send #{4}
funkcija4()
return

AltTab(){
    List =
    WinGet, AllWinsHwnd, List
    Loop, % AllWinsHwnd
    {
        WinGet, exStyle, exStyle, % "ahk_id" AllWinsHwnd%A_Index%
        If !(exStyle & 0x100)
            continue
        WinGetTitle, CurrentWinTitle, % "ahk_id " AllWinsHwnd%A_Index%
        If (CurrentWinTitle = "")
            continue
        IfWinActive, % "ahk_id " AllWinsHwnd%A_Index%
            continue
        WinActivate, % "ahk_id " AllWinsHwnd%A_Index%
            break
    }
}

; AltTabMenu-replacement for Windows 8:
AltTabMenu(){
    List =
    Menu, windows, Add
    Menu, windows, deleteAll
    WinGet, AllWinsHwnd, List
    Loop, %AllWinsHwnd%
    {
        WinGet, exStyle, exStyle, % "ahk_id" AllWinsHwnd%A_Index%
        If !(exStyle & 0x100)
            continue
        WinGetTitle, CurrentWinTitle, % "ahk_id " AllWinsHwnd%A_Index%
        If (CurrentWinTitle = "")
            continue
        WinGetClass, CurrentWinClass, % "ahk_id " AllWinsHwnd%A_Index%
        Menu, windows, Add, %CurrentWinTitle%, ActivateTitle
        WinGet, Path, ProcessPath, % "ahk_id " AllWinsHwnd%A_Index%
        Try 
            Menu, windows, Icon, %CurrentWinTitle%, %Path%,, 0
        Catch 
            Menu, windows, Icon, %CurrentWinTitle%, %A_WinDir%\System32\SHELL32.dll, 3, 0 
    }
    CoordMode, Mouse, Screen
    MouseMove, (0.4*A_ScreenWidth), (0.35*A_ScreenHeight)
    CoordMode, Menu, Screen
    Xm := (0.25*A_ScreenWidth)
    Ym := (0.25*A_ScreenHeight)
    Menu, windows, Show, %Xm%, %Ym%
}

ActivateTitle:
    SetTitleMatchMode 3
    WinActivate, %A_ThisMenuItem%
return