@echo off
SET projectPath="%homepath%"
SET accessToken="<name>:<token>"

echo Welcome to the simple Gitlab Clone Batch Program
echo type "help" to get more information
SET /p repoUrl=Enter the https-RepoUrl:

IF "%repoUrl%" EQU "help" GOTO help

@echo on
cd %projectPath%
FOR /f %%a in ('dir /b /ad %folder%^|find /c /v "" ') do set count1=%%a

git clone "https://%accessToken%@%repoUrl:~8%"

FOR /f %%a in ('dir /b /ad %folder%^|find /c /v "" ') do set count2=%%a

IF "%count1%" EQU "%count2%" pause && EXIT /b 1

start .
EXIT /b 0

:help
echo.
echo Before you first start using this Batch Program edit the file by "right click > edit"
echo Now set the following values
echo - set the "projectPath"-variable (where to save your projects locally)
echo - set the "accessToken"-variable (the access Token you created in gitlab in the format "<name>:<token>")
echo.
pause
EXIT /b 0