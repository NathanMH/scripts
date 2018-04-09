Set vcxsrvShell = CreateObject("WScript.Shell")
vcxsrvShell.Run """C:\Program Files\VcXsrv\vcxsrv.exe"" -nodecoration -screen 0 2560x1440@2"
Set vcxsrvShell = Nothing

Set wslShell = CreateObject("WScript.Shell")
wslShell.Run "bash -c ""C:\Users\natha\Documents\wlaunch""", 0
Set wslShell = Nothing

