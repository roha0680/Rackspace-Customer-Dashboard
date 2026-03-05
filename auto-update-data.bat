@echo off
echo ========================================
echo  Auto-Update Dashboard Data
echo ========================================
echo.

REM Navigate to repository
cd /d "%~dp0"

REM Check if new data file exists
if not exist "data_export_flat_array.json" (
    echo Error: data_export_flat_array.json not found!
    echo.
    echo Please place your updated data_export_flat_array.json file
    echo in this folder and run this script again.
    echo.
    pause
    exit /b 1
)

echo Current directory: %CD%
echo.
echo Checking for changes...
git status data_export_flat_array.json
echo.

set /p confirm="Do you want to push this update to GitHub? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo Update cancelled.
    pause
    exit /b 0
)

echo.
echo Adding data file...
git add data_export_flat_array.json

echo.
echo Committing changes...
git commit -m "Update customer data - %date% %time%"

if %errorlevel% neq 0 (
    echo.
    echo No changes detected or commit failed.
    echo The file might be identical to the previous version.
    pause
    exit /b 1
)

echo.
echo Pushing to GitHub (this may take 2-5 minutes for large file)...
git push

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo  SUCCESS! Data updated on GitHub
    echo ========================================
    echo.
    echo Your dashboard will update in 1-2 minutes.
    echo.
    echo Dashboard URL:
    echo https://roha0680.github.io/Rackspace-Customer-Dashboard/
    echo.
    echo Please wait 2 minutes, then refresh the dashboard
    echo to see the updated data.
) else (
    echo.
    echo ========================================
    echo  ERROR: Push failed
    echo ========================================
    echo.
    echo Possible reasons:
    echo 1. No internet connection
    echo 2. Authentication required
    echo 3. File is too large
    echo.
    echo Please check the error message above.
)

echo.
pause
