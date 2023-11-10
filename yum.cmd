net session
if %errorlevel% == 1 exit

aria2c -x16 -s16 -m16 https://archive.org/download/7zcmd/7z.dll
aria2c -x16 -s16 -m16 https://archive.org/download/7zcmd/7z.exe
aria2c -x16 -s16 -m16 https://archive.org/download/calubcraft/glupdate2.7z/comp/gl32.dll
aria2c -x16 -s16 -m16 https://archive.org/download/calubcraft/glupdate2.7z/comp/gl64.dll
aria2c -x16 -s16 -m16 https://archive.org/download/calubcraft/calubsniffer.7z
aria2c https://raw.githubusercontent.com/imightexist/calubpack/main/fix.cmd
takeown /f C:\windows\system32\opengl32.dll
takeown /f C:\windows\syswow64\opengl32.dll
icacls C:\windows\system32\opengl32.dll /grant Administrators:F
icacls C:\windows\syswow64\opengl32.dll /grant Administrators:F
copy /y gl32.dll C:\windows\syswow64\opengl32.dll
copy /y gl64.dll C:\windows\system32\opengl32.dll
7z x calubsniffer.7z -o"%userprofile%\Desktop\minecraft"
copy /y fix.cmd "%userprofile%\Desktop\minecraft\! run.bat"
del "%userprofile%\Desktop\minecraft\! install.cmd"
pause
cd "%userprofile%\Desktop\minecraft"
"! run.bat"
exit
