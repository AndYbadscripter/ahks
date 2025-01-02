#NoEnv  ; Использовать только встроенные переменные среды
SendMode Input  ; Установить режим отправки ввода
SetWorkingDir %A_ScriptDir%  ; Установить рабочую директорию на текущую

XButton1::Send {NumpadEnter}  ; Переназначить Mouse4 (XButton1) на NumpadEnter
XButton2::Send {NumpadAdd}    ; Переназначить Mouse5 (XButton2) на Numpad+
