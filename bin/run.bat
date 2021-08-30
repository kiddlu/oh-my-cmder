@echo off

for /f "delims=" %%i in (' dir /b /a:-D ^| peco ') do (
	echo %%i %* >> %CMDER_ROOT%\config\.history
	echo %%i %*
	%%i %*
)



