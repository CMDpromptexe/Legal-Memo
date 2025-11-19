@echo off
setlocal enabledelayedexpansion

:: File to store run count
set counterFile=run_count.txt

:: If counter file doesn't exist, initialize it
if not exist %counterFile% (
    echo 0 > %counterFile%
)

:: Read current count
set /p count=<%counterFile%

:: Increment count
set /a count+=1

:: Save new count
echo %count% > %counterFile%

:: Git commands
git add -A
git commit -m "autopush %count%"
git push origin main

echo Commit and push done with message: autopush %count%
