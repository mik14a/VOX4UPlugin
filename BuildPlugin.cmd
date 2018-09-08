set CD=%~dp0
set UE4VERSION=UE_4.20
set UE4PATCHVERSION=2
set RunUAT="C:\Program Files\Epic Games\%UE4VERSION%\Engine\Build\BatchFiles\RunUAT.bat"
call %RunUAT% BuildPlugin -Plugin="%CD%Plugins\VOX4U\VOX4U.uplugin" -Package="%CD%Intermediate\VOX4U" -Rocket
@if ERRORLEVEL 1 goto :error
del VOX4U_%UE4VERSION%.%UE4PATCHVERSION%.7z 2> NUL
7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -mmt%NUMBER_OF_PROCESSORS% VOX4U_%UE4VERSION%.%UE4PATCHVERSION%.7z "%CD%Intermediate\VOX4U"
exit /b 0

:error
exit /b %ERRORLEVEL%
