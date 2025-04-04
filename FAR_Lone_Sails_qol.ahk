#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Состояния
scriptActive := false
currentGear := 0  ; 0 = нейтраль, 1 = X, -1 = C

; Вкл/Выкл скрипта на 0 ())
0::
    scriptActive := !scriptActive
    if (scriptActive) {
        ToolTip, ON, 10, 10
    } else {
        ToolTip, OFF, 10, 10
        ; Сброс всех кнопок
        if (currentGear = 1) {
            Send, {x up}
        } else if (currentGear = -1) {
            Send, {c up}
        }
        currentGear := 0
    }
    SetTimer, RemoveToolTip, 800
return

; Блокировка ЛКМ и замена на E
LButton::
    if (scriptActive) {
        Send, {e}
        return
    }
    Send, {LButton}
return

; Колесо вверх - управление передачами
WheelUp::
    if (!scriptActive) {
        Send, {WheelUp}
        return
    }
    
    if (currentGear = 0) {
        Send, {x down}
        currentGear := 1
    } else if (currentGear = -1) {
        Send, {c up}
        currentGear := 0
    }
return

; Колесо вниз - управление передачами
WheelDown::
    if (!scriptActive) {
        Send, {WheelDown}
        return
    }
    
    if (currentGear = 0) {
        Send, {c down}
        currentGear := -1
    } else if (currentGear = 1) {
        Send, {x up}
        currentGear := 0
    }
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return