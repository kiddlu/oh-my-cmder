@echo off

if '%1'=='?' (
	dir /b /a:D /s | peco | busybox tr -d '[:cntrl:]' | clip
) else if '%1'=='' (
	dir /b /a:D | peco | busybox tr -d '[:cntrl:]' | clip
) else (
	call :help
)

exit /b

:help
echo This is the select dir script
echo.
echo sd : select cur dir
echo sd ? : select cur dir | all subdir
exit /b


