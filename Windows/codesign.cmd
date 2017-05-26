@echo off
rem %1 file to sign
rem %2 certificate password
rem %3 certificate path
signtool.exe sign /f %3 /p "%2" /t http://timestamp.comodoca.com/authenticode /fd SHA256 /seal /du https://nitrokey.com /d Nitrokey %1
