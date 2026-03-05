@echo off
echo ========================================
echo  Push Changes to GitHub
echo ========================================
echo.

REM Check if git is initialized
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not initialized in this folder.
    echo Please follow the instructions in UPDATE_GITHUB.md
    echo.
    pause
    exit /b 1
)

echo Current status:
git status
echo.
echo ========================================
echo.

set /p confirm="Do you want to push these changes to GitHub? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo Cancelled.
    pause
    exit /b 0
)

echo.
echo Adding all files...
git add .

echo.
set /p message="Enter commit message (or press Enter for default): "
if "%message%"=="" set message=Update dashboard and data

echo.
echo Committing changes...
git commit -m "%message%"

echo.
echo Pushing to GitHub...
git push

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo  SUCCESS! Changes pushed to GitHub
    echo ========================================
    echo.
    echo Your dashboard will update in 1-2 minutes.
    echo Check your GitHub Pages URL to see the changes.
) else (
    echo.
    echo ========================================
    echo  ERROR: Push failed
    echo ========================================
    echo.
    echo Please check:
    echo 1. You have internet connection
    echo 2. You have access to the repository
    echo 3. Your credentials are correct
    echo.
    echo See UPDATE_GITHUB.md for troubleshooting.
)

echo.
pause
