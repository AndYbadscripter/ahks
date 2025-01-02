toggle := false  ; Переменная для отслеживания состояния (включено/выключено)
speed := 5  ; Фиксированная скорость нажатий (15 мс)

; Переключение состояния при нажатии клавиши 6
6::
toggle := !toggle  ; Меняем состояние на противоположное

if toggle
{
    ToolTip, pistol on
    SetTimer, RemoveToolTip, -3000  ; Убираем ToolTip через 3 секунды
    SetTimer, CheckForMatch, On     ; Включаем таймер для функции CheckForMatch
}
else
{
    ToolTip, pistol off
    SetTimer, RemoveToolTip, -3000  ; Убираем ToolTip через 3 секунды
    SetTimer, CheckForMatch, Off    ; Отключаем таймер для функции CheckForMatch
}
return

RemoveToolTip:
ToolTip  ; Очищаем ToolTip
return

CheckForMatch:
~LButton::
; Если быстрое нажатие включено
if toggle
{
    ; Запускаем цикл быстрого нажатия ЛКМ
    Loop
    {
        ; Проверяем, удерживается ли ЛКМ
        if GetKeyState("LButton", "P")
        {
            Click
            Sleep speed  ; Фиксированная скорость нажатий (15 мс)
        }
        else
        {
            break  ; Прекращаем цикл, если ЛКМ отпущена
        }
    }
}
return
