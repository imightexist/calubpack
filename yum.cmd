pushd %~dp0
set glupdate=1

aria2c -x16 -s16 -m16 https://github.com/imightexist/calubpack/releases/download/moment/calubsniffer.7z
aria2c https://raw.githubusercontent.com/imightexist/calubpack/main/fix.cmd

if %glupdate% == 0 goto yip
net session
if %errorlevel% == 1 exit
rem aria2c -x16 -s16 -m16 https://archive.org/download/calubcraft/glupdate2.7z/comp/gl32.dll
aria2c -x16 -s16 -m16 https://github.com/imightexist/calubpack/releases/download/moment/gl64.dll
takeown /f C:\windows\system32\opengl32.dll
rem takeown /f C:\windows\syswow64\opengl32.dll
icacls C:\windows\system32\opengl32.dll /grant Administrators:F
rem icacls C:\windows\syswow64\opengl32.dll /grant Administrators:F
rem copy /y gl32.dll C:\windows\syswow64\opengl32.dll
copy /y gl64.dll C:\windows\system32\opengl32.dll

:yip
7z x calubsniffer.7z -o"%userprofile%\Desktop\minecraft"
copy /y fix.cmd "%userprofile%\Desktop\minecraft\! run.bat"
del "%userprofile%\Desktop\minecraft\! install.cmd"
pause
cd "%userprofile%\Desktop\minecraft"
"! run.bat"
