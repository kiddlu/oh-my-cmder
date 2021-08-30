@echo off

cd /d %~dp0
>nul 2>&1 REG.exe query "HKU\S-1-5-19" || (
    echo SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    echo UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    del /f /q "%TEMP%\Getadmin.vbs" 2>nul
    exit /b
)


regsvr32  TabHelper32.dll
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"  regsvr32  TabHelper64.dll

echo. & echo DONE! &&pause>nul & exit