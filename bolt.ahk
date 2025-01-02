toggle := false
scrollDirection := 0

; Горячая клавиша для включения/выключения автоскролла
3::
toggle := !toggle
if (toggle) {
    ToolTip, AutoScroll: ON
    SetTimer, RemoveToolTip, -1000
} else {
    ToolTip, AutoScroll: OFF
    SetTimer, RemoveToolTip, -1000
    scrollDirection := 0 ; Сброс направления
    ToolTip ; Удалить тултип
}
return

; Обработка прокрутки колесом мыши вниз
WheelDown::
if (toggle) {
    if (scrollDirection = -1) {
        scrollDirection := 0
        SetTimer, AutoScroll, Off
        ToolTip ; Удалить тултип
    } else {
        scrollDirection := 1
        ToolTip, L
        SetTimer, AutoScroll, 10
    }
} else {
    Send, {WheelDown}
}
return

; Обработка прокрутки колесом мыши вверх
WheelUp::
if (toggle) {
    if (scrollDirection = 1) {
        scrollDirection := 0
        SetTimer, AutoScroll, Off
        ToolTip ; Удалить тултип
    } else {
        scrollDirection := -1
        ToolTip, R
        SetTimer, AutoScroll, 10
    }
} else {
    Send, {WheelUp}
}
return

; Функция автоскролла
AutoScroll:
if (!toggle || scrollDirection = 0) {
    SetTimer, AutoScroll, Off
    ToolTip ; Удалить тултип
    return
}
if (scrollDirection = 1) {
    Send, {WheelDown}
    ToolTip, L
} else if (scrollDirection = -1) {
    Send, {WheelUp}
    ToolTip, R
}
return

; Удаление тултипа
RemoveToolTip:
ToolTip
return
