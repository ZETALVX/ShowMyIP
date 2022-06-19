;---------------------------------------------------------------

;MsgBox % RunWaitOne("dir " A_ScriptDir)

;MsgBox % RunWaitMany("
;(
;echo Put your commands here,
;echo each one will be run,
;echo and you'll get the output.
;)")

RunWaitOne(command) {
    ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
    shell := ComObjCreate("WScript.Shell")
    ; Execute a single command via cmd.exe
    exec := shell.Exec(ComSpec " /C " command)
    ; Read and return the command's output
    return exec.StdOut.ReadAll()
}

RunWaitMany(commands) {
    shell := ComObjCreate("WScript.Shell")
    ; Open cmd.exe with echoing of commands disabled
    exec := shell.Exec(ComSpec " /Q /K echo off")
    ; Send the commands to execute, separated by newline
    exec.StdIn.WriteLine(commands "`nexit")  ; Always exit at the end!
    ; Read and return the output of all commands
    return exec.StdOut.ReadAll()
}

;---------------------------------------------------------------

;Show public IP

Gui, New, ,"SMI - SHOW MY IP"
Gui, Font, s40 ,
Gui, Add, Text,,ʏᴏᴜʀ ᴘᴜʙʟɪᴄ ɪᴘ ɪs:
Gui, Font, s40 ,
Gui, Add, Text, Texta cRed +Right w350, % RunWaitOne("curl -s http://ifconfig.me")
Gui, Font, s12,Courier New
Gui, Add, Text,cRed +Right w400, by ZETALVX
Gui, Show,AutoSize,SMI - SHOW MY IP
;A:	
;sleep 5000
;GuiControl,, Texta cRed +Right w500, % RunWaitOne("curl -s http://ifconfig.me")
;Goto, A
;MsgBox % "Your public IP is: " RunWaitOne("curl -s http://ifconfig.me")
return

GuiClose:
ExitApp
;---------------------------------------------------------------