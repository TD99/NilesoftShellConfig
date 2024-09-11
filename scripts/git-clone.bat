@echo off

set /p GIT_URL="Enter the Git repository URL (e.g., https://github.com/user/repo.git): "

if "%GIT_URL%"=="" (
    echo Please enter a valid Git repository URL.
) else (
    git clone %GIT_URL%
)

echo Press any key to continue...
pause > nul
