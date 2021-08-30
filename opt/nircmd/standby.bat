@echo off

rem | standby {force} 
rem | Shuts down the computer and puts it in 'standby' mode. If the {force} parameter is specified, the system is forced to go into standby mode without asking for permission from all applications. Generally, it's not recommended to use this parameter. 
rem | This command works only in systems that supports standby mode. 
rem | Example: 
rem | 
rem | standby force 
rem | standby 

@%~dp0\nircmd.exe standby force