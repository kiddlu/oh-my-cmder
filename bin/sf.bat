@echo off

if '%1'=='?' (
	dir /b /a:-D /s | peco | busybox tr -d '[:cntrl:]' | clip
) else if '%1'=='' (
	dir /b /a:-D | peco | busybox tr -d '[:cntrl:]' | clip
) else (
	call :help
)

exit /b

:help
echo This is the select file script
echo.
echo sf : select cur dir file
echo sf ? : select cur dir | all subdir file
exit /b