SetTitleMatchMode 2

if (WinExist("Edge")) {
    WinActivate
    Sleep, 500
} else {
    return
}

bing() {

    Send, !d ; url bar

    Sleep, 500

    Random, RandNum1, 23, 77
    string1.=RandNum1

    Random, RandNum2, 192, 461
    string2.=RandNum2

    Send, %string1%
    Send, {NumpadMult}
    Send, %string2%

    Sleep, 800
    Send {Enter}
    Sleep, 800

}




Loop, 35 {
    bing()
}

sleep, 2000
Send, ^+i
sleep, 3000
; Send, ^+m
; sleep, 3000


Loop, 20 {
    bing()
}

Send, !d ; url bar
Send, "Done"
