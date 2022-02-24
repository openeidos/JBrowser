@echo

del /F /S /Q "%cd%\*.exe"

del /F /S /Q "%cd%\lib\x86_64-win64\*.*"

del /F /S /Q "%cd%\lib\i386-win32\*.*"

echo Finish!

timeout 2


