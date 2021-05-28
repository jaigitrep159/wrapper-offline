:: Wrapper: Offline asset decryption tool
:: Original Author: xomdjl_#1337 (ytpmaker1000@gmail.com)
:: License: MIT
@echo off
title Wrapper: Offline Asset Decryption Tool

echo Welcome to the Wrapper: Offline Asset Decryption tool.
echo:
echo Press 1 if the asset is from Vyond, GoAnimate, GoAnimate4Schools or is a custom asset.
echo Press 2 if the asset is from DomoAnimate or CN Toon Creator.
echo:
:assetaskretry
set /p ASSETTYPE= Response: 
if "%ASSETTYPE%"=="1" ( set RC4=sorrypleasetryagainlater & goto asset )
if "%ASSETTYPE%"=="2" ( set RC4=g0o1a2n3i4m5a6t7e & goto asset )
if "%ASSETTYPE%"=="" ( echo Invalid option. Please try again. & goto assetaskretry )

:asset
echo Drag your file in here.
echo:
:assetpathretry
set /p ASSETPATH= Path: 
if "%ASSETPATH%"=="" ( echo Invalid option. Please try again. & goto assetpathretry)
for %%b in "%ASSETPATH%" do ( set AID=%%~nb )
echo Decrypting file...
if not exist "decrypted_assets" ( mkdir decrypted_assets )
if exist "%AID%.swf" (
	for /R %%i in ("%AID%(*).swf") do (
		for /F "tokens=2 delims=(^)" %%a in ("%%i") do if %%a GTR !last! set "last=%%a"
	)
	set/a last+=1
	set "filename=%AID%(!last!).swf"   
) else (
set FILENAME=%AID%.swf
)
echo %RC4%>%tmp%\rc4key.txt
call utilities\rc4ed\rc4ed.exe "%ASSETPATH%" "%tmp%\rc4key.txt" "decrypted_assets\%FILENAME%">nul
del %tmp%\rc4key.txt
echo File successfully decrypted^!
echo:
echo Press 1 to open it in the included standalone Flash Player
echo Press 2 to open it in the included JPEXS FFDec
echo Press 3 to open it in your default software for opening *.swf files
echo Press 4 to open it in the path where the decrypted asset is
echo Press 5 to exit
echo:
:donextretry
set /p SWFOPTION= Response: 
if "%SWFOPTION%"=="1" start "flashplayer_sa.exe" "decrypted_assets\%FILENAME%"
if "%SWFOPTION%"=="2" start "ffdec\ffdec.exe" "decrypted_assets\%FILENAME%"
if "%SWFOPTION%"=="3" start "" "decrypted_assets\%FILENAME%" )
if "%SWFOPTION%"=="4" start explorer.exe /select,"decrypted_assets\%FILENAME%"
if "%SWFOPTION%"=="5" exit
if "%SWFOPTION%"=="" ( echo Invalid option. Please try again. & goto donextretry )