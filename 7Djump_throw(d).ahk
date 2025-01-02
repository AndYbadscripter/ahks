; Этот скрипт выполняет прыжковый бросок (jump throw) при нажатии 7

; Переменная для использования D
useD := 1  ; 0 - не использовать D, 1 - использовать D

; Создаем hotkey для прыжкового броска
$7::
    if (useD = 1) {
        ; Зажимаем D
        Send, {d down}
        ; Удерживаем D нажатой в течение 1 секунды
        Sleep, 100
    }

    ; Делаем прыжок
    Send, {space down}
    Sleep, 10
    Send, {space up}

    ; Одновременно бросаем гранату
    Sleep, 20
    Send, {LButton down}
    Sleep, 10
    Send, {LButton up}

    if (useD = 1) {
        ; Отпускаем D
        Send, {d up}
    }
return
