@echo
set VERSION=1.0.0.5
set CUR_YYYY=%date:~0,4%
set CUR_MM=%date:~4,3%
set CUR_DD=%date:~7,3%

set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set DateTimeF=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

mkdir "D:\GitHub\_Source\Lazarus\__Backup\JBrowser\%VERSION%\%DateTimeF%


xcopy /d /e /h /c /y /i /F "%cd%" "D:\GitHub\_Source\Lazarus\__Backup\JBrowser\%VERSION%\%DateTimeF%" 

del /F /S /Q "D:\GitHub\_Source\Lazarus\__Backup\JBrowser\%VERSION%\%DateTimeF%\lib"

#copy "%cd%\lib\Framework CEF3 64bit\85.2.11\*.lrf" "D:\GitHub\_Source\Lazarus\__Backup\JBrowser\%VERSION%\%DateTimeF%\lib\Framework CEF3 64bit\85.2.11" 

xcopy /d /e /h /c /y /i /F "%cd%" "D:\GitHub\Project\JBrowser" 

del /F /S /Q "D:\GitHub\Project\JBrowser\*.exe"
del /F /S /Q "D:\GitHub\Project\JBrowser\lib\Framework CEF3 64bit\85.2.11\locales"
del /F /S /Q "D:\GitHub\Project\JBrowser\lib\Framework CEF3 64bit\85.2.11\swiftshader"
del /F /S /Q "D:\GitHub\Project\JBrowser\lib\i386-win32"
del /F /S /Q "D:\GitHub\Project\JBrowser\lib\x86_64-win64"
del /Q "D:\GitHub\Project\JBrowser\lib\Framework CEF3 64bit\85.2.11\*.*"

echo Finish!

timeout 1


