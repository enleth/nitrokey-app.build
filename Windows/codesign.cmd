@echo off
rem %1 file to sign
rem %2 certificate password
rem %3 certificate path
rem You can download signtool from here: https://msdn.microsoft.com/en-us/library/aa387764.aspx
signtool.exe sign /f %3 /p "%2" /t http://timestamp.comodoca.com/authenticode /fd SHA256 /seal /du https://nitrokey.com /d Nitrokey %1
signtool.exe verify /pa %1
