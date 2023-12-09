0::PrintScreen()


PrintScreen() {
    Send "{PrintScreen}"

    Sleep 500

    ; ALT TAB INTO PAINT AND PASTE
    ;Click 600, 1061


    ; Activate Paint to ensure it has focus
    WinActivate "Untitled - Paint"

    Sleep 500

    ; Copy the captured screenshot to the clipboard
    Send "{^c}"  ; Copy the screenshot to the clipboard

    ; Paste the captured screenshot from the clipboard
    Send "{^v}"  ; Ctrl + V to paste
}
