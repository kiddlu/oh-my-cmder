@echo off

if '%1'=='??' (
	for /f "delims=" %%i in (' dir /b /s /a:-D ^| peco ') do (explorer.exe %%i)
	cls
) else if '%1'=='?' (
	for /f "delims=" %%i in (' dir /b /a:-D ^| peco ') do (explorer.exe %%i)
	cls
) else (
	explorer.exe %*
)



