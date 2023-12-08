#Requires AutoHotkey v2.0

global on := False ; Declare on as a global variable

; HOT KEY TO TOGGLE AUTOCLICKER
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
    Loop {
        if (on) {
            Send "{y}" ; must be in quotes
            sleepInterval := Random(5000, 15000)
            Sleep sleepInterval




            ; Replace these coordinates with your desired right-click location
            CoordX := Random(700, 1000)
            CoordY := Random(400, 666)
            Click CoordX, CoordY, "Right"




            ; BREAK LOOP IF ANY OTHER KEY BESIDES '0' IS PRESSED
            if (!GetKeyState("0", "P")) ; "P" is a parameter for this function to know that if its clicking another key, not the letter "P" being clicked.
                break
        }
    }
}
