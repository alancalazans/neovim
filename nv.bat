@echo off
if "%1"=="" goto ops
nvim-qt.exe %1
goto fim
:ops
nvim-qt.exe
:fim
