# Automated Data Update Methods

## Current Setup
- Data file: `data_export_flat_array.json` (38MB)
- Stored in Git with LFS
- Dashboard auto-loads from GitHub
- Update frequency: Monthly

---

## 🎯 Recommended Methods

### Method 1: Watch Folder + Auto-Commit Script (EASIEST) ⭐

Set up a folder that automatically commits and pushes when you drop a new file.

#### Setup:

**1. Create a batch script: `auto-update-data.bat`**

```batch
@echo off
echo ========================================
echo  Auto-Update Dashboard Data
echo ========================================
echo.

REM Navigate to repository
cd "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard"

REM Check if new data file exists
if not exist "data_export_flat_array.json" (
    echo Error: data_export_flat_array.json not found!
    pause
    exit /b 1
)

echo Checking for changes...
git status

echo.
echo Adding data file...
git add data_export_flat_array.json

echo.
echo Committing changes...
git commit -m "Update customer data - %date%"

echo.
echo Pushing to GitHub...
git push

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo  SUCCESS! Data updated on GitHub
    echo ========================================
    echo.
    echo Dashboard will update in 1-2 minutes.
    echo URL: https://roha0680.github.io/Rackspace-Customer-Dashboard/
) else (
    echo.
    echo ========================================
    echo  ERROR: Push failed
    echo ========================================
)

echo.
pause
```

**2. Usage:**
1. Replace the old `data_export_flat_array.json` with your new file
2. Double-click `auto-update-data.bat`
3. Done! Dashboard updates in 1-2 minutes

---

### Method 2: PowerShell Watch Script (AUTOMATIC)

Automatically detects when you update the file and pushes changes.

#### Setup:

**Create: `watch-and-update.ps1`**

```powershell
# Configuration
$repoPath = "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard"
$dataFile = "data_export_flat_array.json"
$checkInterval = 60 # Check every 60 seconds

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Auto-Update Data Watcher" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Watching for changes to $dataFile..." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
Write-Host ""

Set-Location $repoPath
$lastHash = (Get-FileHash $dataFile -Algorithm MD5).Hash

while ($true) {
    Start-Sleep -Seconds $checkInterval
    
    if (Test-Path $dataFile) {
        $currentHash = (Get-FileHash $dataFile -Algorithm MD5).Hash
        
        if ($currentHash -ne $lastHash) {
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Change detected!" -ForegroundColor Green
            Write-Host "Updating GitHub..." -ForegroundColor Yellow
            
            git add $dataFile
            git commit -m "Auto-update customer data - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
            git push
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
                Write-Host "Dashboard will update in 1-2 minutes." -ForegroundColor Cyan
            } else {
                Write-Host "✗ Push failed!" -ForegroundColor Red
            }
            
            $lastHash = $currentHash
            Write-Host ""
        }
    }
}
```

**Usage:**
1. Run: `powershell -ExecutionPolicy Bypass -File watch-and-update.ps1`
2. Leave it running in the background
3. Whenever you replace `data_export_flat_array.json`, it auto-pushes
4. Press Ctrl+C to stop

---

### Method 3: Scheduled Task (RUNS AUTOMATICALLY)

Windows automatically checks and pushes updates daily/weekly.

#### Setup:

**1. Create: `scheduled-update.bat`**

```batch
@echo off
cd "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard"

REM Check if there are changes
git diff --quiet data_export_flat_array.json
if %errorlevel% neq 0 (
    echo Changes detected, pushing to GitHub...
    git add data_export_flat_array.json
    git commit -m "Scheduled update - %date%"
    git push
    echo Update complete!
) else (
    echo No changes detected.
)
```

**2. Create Windows Scheduled Task:**

1. Open **Task Scheduler** (search in Start menu)
2. Click **Create Basic Task**
3. Name: "Update Dashboard Data"
4. Trigger: **Monthly** (or Weekly)
5. Action: **Start a program**
6. Program: `C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard\scheduled-update.bat`
7. Finish

**Usage:**
- Just replace the file whenever you want
- Windows automatically pushes changes on schedule
- No manual action needed!

---

### Method 4: Dropbox/OneDrive Sync + Script

Sync a folder and auto-push when file changes.

#### Setup:

**1. Move repository to synced folder:**
```bash
# Move to Dropbox/OneDrive
move "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard" "C:\Users\Rohan Desai\Dropbox\Dashboard"
```

**2. Use Method 2 (Watch Script) in the synced folder**

**Usage:**
- Update file from any device
- Dropbox/OneDrive syncs it
- Watch script auto-pushes to GitHub

---

### Method 5: GitHub Actions (ADVANCED - Cloud Automation)

Automatically pull data from another source and update.

#### Setup:

**Create: `.github/workflows/update-data.yml`**

```yaml
name: Update Dashboard Data

on:
  schedule:
    - cron: '0 0 1 * *'  # First day of every month at midnight
  workflow_dispatch:  # Manual trigger

jobs:
  update-data:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        with:
          lfs: true
      
      - name: Download new data
        run: |
          # Replace with your data source URL or script
          # curl -o data_export_flat_array.json https://your-data-source.com/export.json
          echo "Add your data download command here"
      
      - name: Commit and push
        run: |
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git add data_export_flat_array.json
          git commit -m "Auto-update data - $(date +'%Y-%m-%d')" || exit 0
          git push
```

**Usage:**
- Runs automatically every month
- Or click "Run workflow" in GitHub Actions tab
- Fully automated, no local action needed

---

## 📊 Comparison

| Method | Automation | Difficulty | Best For |
|--------|-----------|------------|----------|
| **Method 1: Batch Script** | Manual click | ⭐ Easy | Quick monthly updates |
| **Method 2: Watch Script** | Automatic | ⭐⭐ Medium | Frequent updates |
| **Method 3: Scheduled Task** | Automatic | ⭐⭐ Medium | Set-and-forget |
| **Method 4: Cloud Sync** | Automatic | ⭐⭐⭐ Medium | Multi-device access |
| **Method 5: GitHub Actions** | Fully Automatic | ⭐⭐⭐⭐ Hard | Enterprise automation |

---

## 🎯 My Recommendation for Monthly Updates

### Use Method 1: Simple Batch Script

**Why:**
- ✅ Easiest to set up (2 minutes)
- ✅ One double-click to update
- ✅ No background processes
- ✅ Perfect for monthly updates
- ✅ You control when it runs

**Setup:**
1. I'll create the `auto-update-data.bat` file for you
2. Each month, replace `data_export_flat_array.json` with new file
3. Double-click `auto-update-data.bat`
4. Done!

---

## 🚀 Quick Start: Method 1

### Step 1: Create the Script

I'll create `auto-update-data.bat` in your repository folder.

### Step 2: Monthly Update Process

```
1. Export new data → Save as data_export_flat_array.json
2. Replace old file in: C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard\
3. Double-click: auto-update-data.bat
4. Wait for "SUCCESS!" message
5. Dashboard updates in 1-2 minutes
```

### Step 3: Verify Update

Visit: https://roha0680.github.io/Rackspace-Customer-Dashboard/

---

## 📝 Update Checklist

Monthly update process:

- [ ] Export new customer data
- [ ] Save as `data_export_flat_array.json`
- [ ] Replace file in repository folder
- [ ] Run `auto-update-data.bat`
- [ ] Wait for success message
- [ ] Verify dashboard (wait 2 minutes)
- [ ] Notify team of update

---

## 🔧 Troubleshooting

### "Permission denied" error
Run: `git config credential.helper store`
Then push once manually to save credentials

### "File too large" error
Git LFS is already set up, should work fine

### "Nothing to commit" message
File hasn't changed or is identical to previous version

### Push takes a long time
Normal for 38MB file, wait 2-5 minutes

---

## 💡 Pro Tips

1. **Keep a backup** of previous month's data
2. **Test the script** before the actual update
3. **Document the update** in commit message
4. **Notify your team** after updating
5. **Check dashboard** after 2 minutes to verify

---

## 🎬 Next Steps

Would you like me to:
1. ✅ Create the `auto-update-data.bat` script for you?
2. ✅ Set up the watch script for automatic updates?
3. ✅ Configure a scheduled task?

Let me know which method you prefer, and I'll set it up for you!
