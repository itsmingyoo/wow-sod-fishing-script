#Requires AutoHotkey v2.0

global on := False ; Declare on as a global variable

0::ToggleAutoClick()

ToggleAutoClick() {
    global on ; Access the global on variable
    on := !on
    SoundBeep(1000 + 500 * on)

    if (on) {
        ClickLoop()
    }
}

ClickLoop() {
    global on
    while (on) {
        SendInput "{y}"
        Sleep 2000
    }
}
