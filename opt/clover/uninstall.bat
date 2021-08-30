@echo off

cd /d %~dp0
>nul 2>&1 REG.exe query "HKU\S-1-5-19" || (
    echo SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    echo UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    del /f /q "%TEMP%\Getadmin.vbs" 2>nul
    exit /b
)

regsvr32 /u /s TabHelper32.dll
regsvr32 /u /s TabHelper64.dll

rd/s/q "%LOCALAPPDATA%\Clover"2>nul
rd/s/q "%LOCALAPPDATA%\Clover.users"2>nul
rd/s/q "%UserProfile%\AppData\LocalLow\Clover"2>nul
rd/s/q "%UserProfile%\AppData\LocalLow\Clover.users"2>nul
rd/s/q "%UserProfile%\Local Settings\Clover"2>nul
rd/s/q "%UserProfile%\Local Settings\Clover.users"2>nul

::taskkill /f /im explorer.exe >nul 2>nul
::start explorer
cls & echo. & echo DONE! &&pause>nul & exit