#Requires AutoHotkey v2.0

cps := 14
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
    global on ; Access the global on variable
    While (on) {
        Send "{y}" ; must be in quotes
        Sleep(1000 / cps)
        sleepInterval := Random(3000, 8000)
        Sleep sleepInterval
        ; Replace these coordinates with your desired right-click location
        Click 900, 500, "Right"

        ; '-' breaks loop
        if (!GetKeyState("0", "P")) ; "P" is a parameter for this function to know that if its clicking another key, not the letter "P" being clicked.
            break
    }
}
