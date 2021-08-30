@echo off

if '%*'=='' call :help & exit /b
if '%1'=='-' (
    cd /d %OLDPWD%
    set OLDPWD="%cd%"
) else if '%1'=='~' (
    cd /d %USERPROFILE%
	if not errorlevel 1 set OLDPWD="%cd%"
) else if '%1'=='!' (
    cd /d %USERPROFILE%\Desktop
	if not errorlevel 1 set OLDPWD="%cd%"
) else if '%1'=='@' (
    cd /d %CMDER_ROOT%
	if not errorlevel 1 set OLDPWD="%cd%"
) else if '%1'=='?' (
	for /f "delims=" %%i in (' dir /b /a:D ^| peco ') do (cd /d %%i)
	cls
	if not errorlevel 1 set OLDPWD="%cd%"
) else if '%1'=='??' (
	for /f "delims=" %%i in (' dir /b /s /a:D ^| peco ') do (cd /d %%i)
	cls
	if not errorlevel 1 set OLDPWD="%cd%"
) else (
    cd /d %*
    if not errorlevel 1 set OLDPWD="%cd%"
)
exit /b

:help
echo This is the unix like cd hook which used in cmder
echo.
echo cd - : last dir
echo cd ~ : windows user profile dir
echo cd ! : windows user desktop dir
echo cd @ : cmder root dir
echo cd ? : select dir to enter(depth 1)
echo cd ?? : select dir to enter(all subdir)
