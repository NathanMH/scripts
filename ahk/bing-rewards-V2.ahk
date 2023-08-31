#Requires AutoHotkey >=2.0
SetTitleMatchMode 2

if (WinExist("Edge")) {
    WinActivate
    Sleep 500
} else {
    return
}

bing() {
	Send "!d" ; url bar
	Sleep 500
	
	Rand1 := Random(17, 86)
	Rand2 := Random(121, 156)
	
	Send Rand1
	Send "{NumpadMult}"
	Send Rand2
	Sleep	800
	Send "{Enter}"
	Sleep 800
}

Loop 35 {
    bing
}


Sleep 2000
Send "^+i"
Sleep 3000



Loop 20 {
    bing
}

Send "!d"
Send "Done"
