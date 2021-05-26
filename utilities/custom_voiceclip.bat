:: Wrapper: Offline Custom Voice Clip Importer
:: Original Author: xomdjl_#1337 (ytpmaker1000@gmail.com)
:: License: MIT
:: Comments: This is heavily WIP and unfinished. You may wanna use import.bat instead for the time being.
@echo off
title Wrapper: Offline custom voice clip importer

echo Welcome to the Wrapper: Offline voice clip importer.
echo:
echo Drag your audio file in here and hit Enter.
echo ^(Only *.mp3 is supported. If it's not an .mp3 file, it will
echo automatically convert it with FFMPEG.^)
echo:
echo ^(It should also be worth noting that this will overwrite any
echo voiceover files that are already there.^)
set /p VOPATH= Path: 
for %%b in "%VOPATH%" do ( set VOEXT=%%~xb )
if not "%VOEXT%"==.mp3 (
	echo Converting audio file to .mp3...
	echo:
	call ffmpeg\ffmpeg.exe -i "%VOPATH% "import_these\voice\rewriteable.mp3" -y
	echo Successfully converted and imported.
	echo:
	pause & exit
) else (
	echo Importing audio file...
	echo:
	copy "%VOPATH%" "import_these\voice\rewriteable.mp3" /y>nul
	echo Voice clip imported successfully^!
	echo:
	pause & exit
)