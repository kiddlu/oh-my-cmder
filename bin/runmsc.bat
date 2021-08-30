@echo off

if '%*'=='' call :help & exit /b

start %1.msc

exit /b

:help
echo This is Microsoft Snap-In Control table
echo.
echo runmsc certmgr
echo runmsc comexp
echo runmsc compmgmt
echo runmsc devmgmt
echo runmsc diskmgmt
echo runmsc eventvwr
echo runmsc fsmgmt
echo runmsc gpedit
echo runmsc iis
echo runmsc iis6
echo runmsc lusrmgr
echo runmsc NAPCLCFG
echo runmsc nfsmgmt
echo runmsc perfmon
echo runmsc printmanagement
echo runmsc rsop
echo runmsc secpol
echo runmsc services
echo runmsc taskschd
echo runmsc tpm
echo runmsc WF
echo runmsc WmiMgmt