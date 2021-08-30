@echo on

set SYSINTERNALS_ROOT=%CMDER_ROOT%\vendor\sysinternals
set SYSINTERNALS_SETUP=%SYSINTERNALS_ROOT%\SysinternalsSuite.zip

"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "((New-Object System.Net.WebClient).DownloadFile('https://download.sysinternals.com/files/SysinternalsSuite.zip','%SYSINTERNALS_SETUP%'))"

%~dp0\..\busybox\busybox.exe unzip %SYSINTERNALS_ROOT%\SysinternalsSuite.zip -d %SYSINTERNALS_ROOT%
%~dp0\..\busybox\busybox.exe rm %SYSINTERNALS_ROOT%\SysinternalsSuite.zip