@echo off

if '%*'=='' call :help & exit /b
if '%1'=='signoff' (
	bcdedit /set loadoptions DISABLE_INTEGRITY_CHECKS
) else if '%1'=='cp' (
	start rundll32 shell32.dll,Control_RunDLL
) else if '%1'=='dm' (
	start rundll32 devmgr.dll DeviceManager_Execute
) else if '%1'=='tson' (
	bcdedit /set testsigning on
) else if '%1'=='tsoff' (
	bcdedit /set testsigning off
) else if '%1'=='suspend' (
	rundll32  powroprof.dll,SetSuspendState
) else if '%1'=='sleep' (
	rundll32  powrprof.dll,SetSuspendState 0,1,0
) else if '%1'=='lock' (
	rundll32.exe User32.dll,LockWorkStation
) else if '%1'=='gp' (
	start gpedit.msc
) else if '%1'=='ev' (
	start eventvwr.msc
) else if '%1'=='reg' (
	start regedit.exe
) else if '%1'=='tskmg' (
	start taskmgr.exe
) else if '%1'=='srv' (
	start services.msc
) else if '%1'=='sp' (
	control sysdm.cpl
) else if '%1'=='ups' (
	rundll32 keymgr.dll,KRShowKeyMgr
) else if '%1'=='lock' (
	control sysdm.cpl
)
exit /b

::https://roothaxor.github.io/Windows/

:help
echo This is the windows control batfile for easy use
echo.
echo winctl signoff : disable intergrity checks
echo winctl cp      : Control Panel
echo winctl dm      : Device Manager
echo winctl ev      : Event Viewer
echo winctl gp      : Group Policy
echo winctl reg     : Reg Editor
echo winctl tskmg   : Task Manager
echo winctl srv     : Services Manager
echo winctl tson    : testsigning on
echo winctl tsoff   : testsigning off
echo winctl suspend : PC suspend
echo winctl sleep   : PC sleep
echo winctl sp      : System Properties
echo winctl ups     : Stored User names and Passwords