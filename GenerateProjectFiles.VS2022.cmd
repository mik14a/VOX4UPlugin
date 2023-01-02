set BuildBat="C:/Program Files/Epic Games/UE_5.1/Engine/Build/BatchFiles/Build.bat"
%BuildBat% -projectfiles -vs2022 -project="%~dp0VOX4UPlugin.uproject" -game -rocket -progress
