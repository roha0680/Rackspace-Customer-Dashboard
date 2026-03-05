# Setup Guide: External Data Hosting

Your data file is 38MB (exceeds GitHub's 25MB limit). Here's how to host it externally.

---

## 🎯 RECOMMENDED: GitHub Releases (Easiest & Free)

### Step 1: Push Everything Except the Data File

The `.gitignore` file now excludes `data_export_flat_array.json`, so you can push everything else:

```bash
git add .
git commit -m "Add dashboard (data file hosted separately)"
git push
```

### Step 2: Create a GitHub Release

1. **Go to your repository on GitHub**
   - URL: `https://github.com/YOUR_USERNAME/YOUR_REPO`

2. **Click "Releases"** (right sidebar)

3. **Click "Create a new release"**

4. **Fill in the details:**
   - Tag: `data-v1.0`
   - Release title: `Customer Data v1.0`
   - Description: `Initial customer data release`

5. **Attach the file:**
   - Drag and drop `data_export_flat_array.json`
   - Or click "Attach binaries" and select the file

6. **Click "Publish release"**

### Step 3: Get the Download URL

After publishing, you'll see your file listed. Right-click on it and copy the link address.

The URL will look like:
```
https://github.com/YOUR_USERNAME/YOUR_REPO/releases/download/data-v1.0/data_export_flat_array.json
```

### Step 4: Update Dashboard

Open `index.html` and find this line (around line 308):

```javascript
const response = await fetch('data_export_flat_array.json');
```

Replace with your release URL:

```javascript
const response = await fetch('https://github.com/YOUR_USERNAME/YOUR_REPO/releases/download/data-v1.0/data_export_flat_array.json');
```

### Step 5: Push the Updated Dashboard

```bash
git add index.html
git commit -m "Update data URL to use GitHub Release"
git push
```

### Step 6: Done!

Your dashboard will now load data from the GitHub Release. Wait 1-2 minutes for GitHub Pages to update.

---

## 🔄 Updating Data Later

When you need to update the data:

### Option A: Create New Release
1. Create a new release (e.g., `data-v1.1`)
2. Attach the new JSON file
3. Update the URL in `index.html`
4. Push changes

### Option B: Replace File in Existing Release
1. Go to the release
2. Delete the old file
3. Upload the new file (same name)
4. No code changes needed!

---

## 🌐 ALTERNATIVE: Google Drive

### Step 1: Upload to Google Drive

1. Go to Google Drive
2. Upload `data_export_flat_array.json`
3. Right-click the file → Share
4. Change to "Anyone with the link can view"
5. Copy the link

### Step 2: Convert to Direct Download Link

Your link looks like:
```
https://drive.google.com/file/d/1ABC123XYZ/view?usp=sharing
```

Convert to direct download:
```
https://drive.google.com/uc?export=download&id=1ABC123XYZ
```

(Replace `1ABC123XYZ` with your actual file ID)

### Step 3: Update Dashboard

In `index.html`, line 308:

```javascript
const response = await fetch('https://drive.google.com/uc?export=download&id=YOUR_FILE_ID');
```

### Step 4: Push Changes

```bash
git add index.html
git commit -m "Update data URL to use Google Drive"
git push
```

---

## 🔧 ALTERNATIVE: Git LFS

If you want to keep the file in the repository:

### Step 1: Install Git LFS

Download from: https://git-lfs.github.com/

Or install via command:
```bash
git lfs install
```

### Step 2: Track JSON Files

```bash
git lfs track "*.json"
git add .gitattributes
```

### Step 3: Remove from .gitignore

Edit `.gitignore` and remove this line:
```
data_export_flat_array.json
```

### Step 4: Add and Push

```bash
git add data_export_flat_array.json
git commit -m "Add data file with Git LFS"
git push
```

**Note:** Git LFS has a 1GB bandwidth limit per month on free tier.

---

## 📋 Quick Decision Guide

**Choose GitHub Releases if:**
- ✅ You want it free and unlimited
- ✅ You don't update data very frequently
- ✅ You want version control for data

**Choose Google Drive if:**
- ✅ You update data frequently
- ✅ You want easy file replacement
- ✅ You're familiar with Google Drive

**Choose Git LFS if:**
- ✅ You want everything in one repository
- ✅ Your bandwidth usage is low
- ✅ You're comfortable with Git

---

## 🚀 Recommended Steps RIGHT NOW

1. **Push the dashboard without data:**
   ```bash
   git add .
   git commit -m "Add dashboard"
   git push
   ```

2. **Create GitHub Release:**
   - Go to your repo → Releases → Create new release
   - Tag: `data-v1.0`
   - Attach `data_export_flat_array.json`
   - Publish

3. **Copy the download URL**

4. **Update `index.html` line 308** with the URL

5. **Push the update:**
   ```bash
   git add index.html
   git commit -m "Update data URL"
   git push
   ```

6. **Wait 1-2 minutes** and check your GitHub Pages URL

Done! Your dashboard will work with the large data file.

---

## ❓ Need Help?

Let me know which method you want to use, and I can:
1. Update the dashboard code for you
2. Provide the exact commands
3. Help troubleshoot any issues

The file is already excluded from git (via `.gitignore`), so you can push everything else right now!
