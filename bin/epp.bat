@echo off

for /f "delims=" %%i in (' dir /b /a:-D ^| peco ') do (explorer.exe %%i)
cls
