#Persistent
#NoEnv
#SingleInstance Force
SetBatchLines -1

try {
    ; Первый энкодер управляет Firefox
    F24::
    ; Увеличение громкости Firefox
    Run, cmd /c ".\SoundVolumeView.exe /ChangeVolume ""Firefox"" +2", , Hide
    Return

    F23::
    ; Уменьшение громкости Firefox
    Run, cmd /c ".\SoundVolumeView.exe /ChangeVolume ""Firefox"" -2", , Hide
    Return

    ; Второй энкодер управляет Discord
    F22::
    ; Увеличение громкости Discord
    Run, cmd /c ".\SoundVolumeView.exe /ChangeVolume ""Discord"" +2", , Hide
    Return

    F21::
    ; Уменьшение громкости Discord
    Run, cmd /c ".\SoundVolumeView.exe /ChangeVolume ""Discord"" -2", , Hide
    Return
} catch e {
    MsgBox, 48, Ошибка, Произошла ошибка: %e%
    ExitApp
}

OnExit, ExitCleanup
return

ExitCleanup:
; Здесь вы можете добавить любой код для очистки перед выходом из приложения
return
