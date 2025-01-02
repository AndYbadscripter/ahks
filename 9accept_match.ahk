autoAccept := false
clickOnFind := 1 ; 0 - без нажатия ЛКМ, 1 - с нажатием ЛКМ
return

; Горячая клавиша для запуска/остановки скрипта
9::
    autoAccept := !autoAccept
    if (autoAccept)
    {
        SetTimer, CheckForMatch, 1000
        ToolTip, accept ON. ; Сообщение постоянно отображается при включении
    }
    else
    {
        SetTimer, CheckForMatch, Off
        ToolTip, accept OFF.
        SetTimer, RemoveToolTip, -3000 ; Убираем ToolTip через 3 секунды после отключения
    }
return

CheckForMatch:
    ; Координаты области поиска
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    ; Установите основной цвет и диапазон цвета
    TargetColor := 0x36B752 ; Целевой цвет кнопки
    ColorVariation := 5	; Допустимое отклонение в значении цвета

    ; Ищем пиксель по всему экрану, соответствующий цвету с допустимым отклонением
    PixelSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %TargetColor%, %ColorVariation%, Fast RGB
    if (ErrorLevel = 0)
    {
        ; Получаем текущие координаты мыши
        MouseGetPos, currentX, currentY

        ; Проверяем, находится ли мышь уже на нужных координатах
        if (currentX != FoundX || currentY != FoundY)
        {
            ; Перемещаем мышь к найденному пикселю
            MouseMove, %FoundX%, %FoundY%
        }

        ; Показываем ToolTip о том, что пиксель найден, но не убираем его
        ToolTip, accept ON.`nPixel found at X%FoundX% Y%FoundY%.

        if (clickOnFind)
        {
            ; Нажатие ЛКМ при нахождении пикселя
            Click
        }
    }
return

RemoveToolTip:
    ToolTip
return
