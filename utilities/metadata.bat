:: Wrapper: Offline Metadata
:: Important variables for things like the version number

:: Opens this file in Notepad when run
setlocal
if "%SUBSCRIPT%"=="" ( start notepad.exe "%CD%\%~nx0" & exit )
endlocal

:: Version number and build number
set WRAPPER_VER=1.3.0
set WRAPPER_BLD=21