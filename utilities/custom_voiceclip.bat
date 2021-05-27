:: Wrapper: Offline Custom Voice Clip Importer
:: Original Author: xomdjl_#1337 (ytpmaker1000@gmail.com)
:: License: MIT
@echo off
title Wrapper: Offline custom voice clip importer

:main
echo Welcome to the Wrapper: Offline voice clip importer.
echo:
echo Press 1 to record your voice using the Windows Sound Recorder.
echo Press 2 to record your voice with an external program ^(e.g. Audacity^)
echo Press 3 if you have an audio file you'd like to use.
echo:
set /p VOCHOICE= Response: 
if "%VOCHOICE%"=="1" (
	echo Opening the Windows Sound Recorder...
	PING -n 2 127.0.0.1>nul
	start explorer.exe shell:appsFolder\Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe!App
	echo When finished recording, you may press any key to go to the next step.
	echo:
	pause & goto import
)
if "%VOCHOICE%"=="2" (
	echo Please specify which program you will be using.
	echo:
	echo ^(It's preferred that you use the program's raw filename
	echo but omit the .exe at the end.^)
	echo:
	:programnameaskretry
	set /p PROGRAMSNAME= Program name: 
	for %%a in ( "%PROGRAMFILES%" "%PROGRAMFILES(X86)%" "%COMMONFILES%" "%PROGRAMFILES%\%PROGRAMSNAME%" "%PROGRAMFILES(X86)%\%PROGRAMSNAME%" "%COMMONFILES%\%PROGRAMSNAME%" ) do (
		if exist "%%a\%PROGRAMSNAME%.exe" ( 
			echo Detected %PROGRAMSNAME%.exe in at least one of the common program directories.
			echo:
			echo Launching %PROGRAMSNAME%.exe...
			PING -n 2 127.0.0.1>nul
			start "%%a\%PROGRAMSNAME%.exe"
			echo When finished recording, you may press any key to go to the next step.
			echo:
			pause & goto import
		) else (
			echo Could not find %PROGRAMSNAME%.exe in any of the common program directories.
			echo Please try re-entering your program name. Or, enter "nevermind" to try
			echo something else.
			echo:
			echo ^(If it already found it, it is possible that this may be a bug.^)
			echo:
			goto programnameaskretry
		)
	)
	if /i "%PROGRAMSNAME%"=="nevermind" ( cls & goto main )
)
if "%VOCHOICE%"=="3" ( goto import )
:import
echo Drag your audio file in here and hit Enter.
echo ^(Only *.mp3 is supported. If it's not an .mp3 file, it will
echo automatically be converted using FFMPEG.^)
echo:
echo ^(It should also be worth noting that this will overwrite any
echo voiceover files that are already there.^)
set /p VOPATH= Path: 
for %%b in "%VOPATH%" do ( set VOEXT=%%~xb )
if not "%VOEXT%"==.mp3 (
	echo Converting audio file to .mp3...
	echo:
	call ffmpeg\ffmpeg.exe -i "%VOPATH% "..\server\vo\rewriteable.mp3" -y
	echo Successfully converted and imported.
	echo:
	pause & exit
) else (
	echo Importing audio file...
	echo:
	copy "%VOPATH%" "..\server\vo\rewriteable.mp3" /y>nul
	echo Voice clip imported successfully^!
	echo:
	pause & exit
)