Capslock::Ctrl

; Window management

#h::SendEvent #{Left}
#l::SendEvent #{Right}
#j::SendEvent #{Down}
#k::SendEvent #{Up}

; Windows Explorer Navigation

#IfWinActive, ahk_class CabinetWClass
^h::
   ControlGet renamestatus,Visible,,Edit1,A
   ControlGetFocus focussed, A
   if(renamestatus!=1&&(focussed=”DirectUIHWND3?||focussed=SysTreeView321))
   {
    SendInput {Alt Left}
  }else{
      Send {Backspace}
  }
#IfWinActive