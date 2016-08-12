rem Steps to make vim portable under windows
rem 1. Move the bat to parent folder or wherever you want
rem 2. Change the HOME var to the .vimrc dir
rem 3. Change vim-x86\gvim.exe to your path to gvim.exe
rem 4. Double click on RunEverVim.bat and you're all set
@echo off
if "%1"=="h" goto begin 
start mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit 
:begin
set HOME=%~dp0\home\EverVim\
SET PATH=%PATH%;%~dp0\tools\
vim-x86\gvim.exe %*
exit
