#Requires AutoHotkey v2.0

global on := False ; Declare on as a global variable

9::ToggleAutoClick()


ToggleAutoClick() {
    global on ; Access the global on variable
    on := !on

    SoundBeep(1000 + 500 * on)

    if (on) {
        BuyCallous()
    }
}

BuyCallous() {
    ; Y target
    ; = interact

    while (on) {
        ; TARGET AND INTERACT THEN WAIT
        Send "{y}"
        Send "{=}"
        Sleep 500

        ; CLICK ON SEARCH BAR
        Click 500, 333
        Click 500, 333
        Sleep 1000

        ; TYPE IN ITEM NAME
        SendText "Callous Axe"

        ;TEST ITEM
        ;SendText "Forest Mushroom Cap"

        Sleep 1000

        ; PURCHASE ITEM
        Click 550, 390, "Right"

        Sleep 1000

        Click 979, 278

        Sleep 2000
    }
}
