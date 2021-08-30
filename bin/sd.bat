@echo off

dir /b /a:D /s | peco | busybox tr -d '[:cntrl:]' | clip

