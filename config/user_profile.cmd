:: use this file to run your own startup commands
:: use in front of the command to prevent printing the command

:: uncomment this to have the ssh agent load when cmder starts
:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd" /k exit

:: uncomment the next two lines to use pageant as the ssh authentication agent
:: SET SSH_AUTH_SOCK=/tmp/.ssh-pageant-auth-sock
:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-pageant.cmd"

:: you can add your plugins to the cmder path like so
:: set "PATH=%CMDER_ROOT%\vendor\whatever;%PATH%"

:: arguments in this batch are passed from init.bat, you can quickly parse them like so:
:: more useage can be seen by typing "cexec /?"

:: %ccall% "/customOption" "command/program"

@echo off

::echo on
rem Change the prompt style
prompt $E[1;32;40m$P$S$S$_$E[1;30;40m#$S$E[0m
set HOME=%USERPROFILE%

set PATH=%CMDER_ROOT%\vendor\busybox;%PATH%
set PATH=%CMDER_ROOT%\vendor\nircmd;%PATH%
set PATH=%CMDER_ROOT%\vendor\android;%PATH%
set PATH=%CMDER_ROOT%\vendor\openssh;%PATH%
::set PATH=%CMDER_ROOT%\vendor\vim;%PATH%
set PATH=%CMDER_ROOT%\vendor\sysinternals;%PATH%
set PATH=%CMDER_ROOT%\vendor\uwe-sieber;%PATH%
set PATH=%CMDER_ROOT%\vendor\scrcpy;%PATH%

set PATH=%CMDER_ROOT%\vendor\gnu;%PATH%
set PATH=%CMDER_ROOT%\vendor\github;%PATH%
set PATH=%CMDER_ROOT%\vendor\gettext-iconv-windows\bin;%PATH%
set PATH=%CMDER_ROOT%\vendor\msls;%PATH%
set LS_OPTIONS=-bhAC --color=auto --recent --streams

rem cygwin
::set CYGWIN_ROOT=%CMDER_ROOT%\vendor\cygwin
::%CYGWIN_ROOT%\bin\bash.exe -c "cd ~;/usr/bin/cygpath.exe -awl ." > "%CMDER_ROOT%\config\cygwin_homepath"
::set /p HOME=<"%CMDER_ROOT%\config\cygwin_homepath"
::if exist %CMDER_ROOT%\vendor\cygwin\bin (call :cygwin-init)

rem chocolatey
if exist %CMDER_ROOT%\vendor\chocolatey\bin set PATH=%CMDER_ROOT%\vendor\chocolatey\bin;%PATH%

rem my-xbin
set PATH=%PATH%;%HOME%\xbin\windows\console
set PATH=%PATH%;%HOME%\xbin\windows\wrapper
set PATH=%PATH%;%HOME%\xbin\python

rem config
set PATHEXT=.PY;.LNK;.URL;%PATHEXT%
::GBK 936 EN_US 437 UTF-8 65001
chcp.com 65001 >nul
cls
goto end

:cygwin-init
::set PATHEXT=.SH;.PY;.PL;.LNK;.URL;%PATHEXT%
::set PATH=%CMDER_ROOT%\vendor\cygwin\bin;%PATH%
::set TERM=cygwin
::set LANG=en_US.UTF-8
::set DISPLAY=:0.0
::doskey gitk=bash -i -c "gitk $*"
::doskey gunzip=bash -i -c "gunzip $*"
::doskey grep=grep --color $*
::doskey ls=ls --show-control-chars -F --color $*

:end
