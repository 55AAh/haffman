echo off
cls

set if=%~1
set of=%~2
set tt=%~3
if "%~1" == "" (
	set /P if="Enter path to input file: "
)
if "%~2" == "" (
	set /P of="Enter path to image: "
)
if "%~3" == "" (
	set /P tt="Enter tree type: "
)
haffman_method.exe "-tree%tt%" "%if%" "%of%"
if %errorlevel% neq 0 (
	exit /b %errorlevel%
)
if exist "%of%.png" del "%of%.png"
dot -Tpng "%of%" > "%of%.png"
if %errorlevel% neq 0 (
    del "%of%"
	if exist "%of%.png" del "%of%.png"
	exit /b %errorlevel%
)
del "%of%"