:: opens vfproxy in a standalone batch so that i can use a tool that silently runs batch files
:: this is stupid
:: please help
@echo off
pushd "%~dp0"
title VFProxy PHP Launcher for Wrapper: Offline
pushd ..\wrapper\vfproxy
..\..\utilities\php\php.exe -S 127.0.0.1:1337
echo:
echo If you see any errors, I have no idea how
echo that's possible. VFProxy is supposed to work
echo without any problems.
echo:
pause & exit