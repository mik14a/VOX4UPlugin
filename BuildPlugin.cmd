set CD=%~dp0
set UE5VERSION=UE_5.1
set UE5PATCHVERSION=0
set RunUAT="C:\Program Files\Epic Games\%UE5VERSION%\Engine\Build\BatchFiles\RunUAT.bat"
call %RunUAT% BuildPlugin -Plugin="%CD%Plugins\VOX4U\VOX4U.uplugin" -Package="%CD%Intermediate\VOX4U" -Vs2022 -Rocket
@if ERRORLEVEL 1 goto :error
del VOX4U_%UE5VERSION%.%UE5PATCHVERSION%.7z 2> NUL
7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -mmt%NUMBER_OF_PROCESSORS% VOX4U_%UE5VERSION%.%UE5PATCHVERSION%.7z "%CD%Intermediate\VOX4U"
exit /b 0

:error
exit /b %ERRORLEVEL%
