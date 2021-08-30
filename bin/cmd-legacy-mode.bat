@echo off
::https://superuser.com/questions/954425/how-to-enable-the-new-console-in-windows-10-and-what-are-its-defaults

if '%*'=='' call :help & exit /b
if '%1'=='on' (
  reg add "HKCU\Console" /v ForceV2 /t REG_DWORD /d 0x0 /f
) else if '%1'=='off' (
  reg add "HKCU\Console" /v ForceV2 /t REG_DWORD /d 0x1 /f
) else (
  call :help
)
exit /b

:help
reg query "HKCU\Console" /v ForceV2
echo Windows cmd legacy mode [on] / [off]
echo.
