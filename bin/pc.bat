@echo off

peco | busybox tr -d '[:cntrl:]' | clip
cls

