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
    while (on) {
        ; START BY PRESSING THE "Y" KEY
        SendInput "{y}"

        Sleep 1000

        ; SNAPSHOT THE BOBBLE LOCATION
        Send "{PrintScreen}"

        Sleep 1000

        ; ALT TAB INTO PAINT
        ; Click 600, 1061
        WinActivate "Untitled - Paint"

        ; PASTE CLIPBOARD
        Send "{Ctrl Down}"
        Send "{v}"

        Sleep 500

        Send "{Ctrl Up}"

        Sleep 30000

        ; invoke the sleep function with the variable we created for 5-15 seconds
        sleepInterval := Random(5000, 15000) ; variable for 5-15 seconds, one cast is 30 seconds
        Sleep sleepInterval

        ; Replace these coordinates with your desired right-click location
        CoordX := Random(705, 878)
        CoordY := Random(400, 495)
        Click CoordX, CoordY, "Right"

        ; BREAK LOOP IF ANY OTHER KEY BESIDES '0' IS PRESSED - THIS MEANS THAT RIGHT CLICK WILL BREAK IT TOO, SO WE MUST MAKE A SEPARATE TERMINATE FUNCTION
        ; if (!GetKeyState("0", "P")) ; "P" is a parameter for this function to know that if it's clicking another key, not the letter "P" being clicked.
        ;    break

        Sleep 3000
    }
}
