# GitHub Pages Hosting Guide

## Step-by-Step Instructions to Host Your Dashboard on GitHub Pages

### Prerequisites
- GitHub account (create one at https://github.com if you don't have one)
- Git installed on your computer (download from https://git-scm.com/)

---

## Option 1: Using GitHub Web Interface (Easiest - No Git Commands)

### Step 1: Create a New Repository
1. Go to https://github.com
2. Click the **+** icon in the top right → **New repository**
3. Repository name: `rackspace-customer-dashboard` (or any name you prefer)
4. Description: "Rackspace Enterprise/Commercial Customer Dashboard"
5. Select **Public** (required for free GitHub Pages)
6. Check **Add a README file**
7. Click **Create repository**

### Step 2: Upload Files
1. In your new repository, click **Add file** → **Upload files**
2. Drag and drop these files:
   - `dashboard.html`
   - `data_export_flat_array.json`
   - `sample_data.csv` (optional)
3. Add commit message: "Initial dashboard upload"
4. Click **Commit changes**

### Step 3: Rename dashboard.html to index.html
1. Click on `dashboard.html` in your repository
2. Click the pencil icon (Edit this file)
3. Click the filename at the top and change it to `index.html`
4. Scroll down and click **Commit changes**

### Step 4: Enable GitHub Pages
1. Go to your repository **Settings** tab
2. Scroll down to **Pages** section (left sidebar)
3. Under **Source**, select:
   - Branch: `main` (or `master`)
   - Folder: `/ (root)`
4. Click **Save**
5. Wait 1-2 minutes for deployment

### Step 5: Access Your Dashboard
Your dashboard will be available at:
```
https://YOUR_USERNAME.github.io/rackspace-customer-dashboard/
```

Replace `YOUR_USERNAME` with your actual GitHub username.

---

## Option 2: Using Git Command Line (Recommended for Updates)

### Step 1: Initialize Git Repository
Open your terminal/command prompt in the dashboard folder:

```bash
# Navigate to your dashboard folder
cd "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard"

# Initialize git repository
git init

# Rename dashboard.html to index.html
mv dashboard.html index.html

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Rackspace Customer Dashboard"
```

### Step 2: Create GitHub Repository
1. Go to https://github.com
2. Click **+** → **New repository**
3. Name: `rackspace-customer-dashboard`
4. Select **Public**
5. **DO NOT** check "Add a README file"
6. Click **Create repository**

### Step 3: Push to GitHub
Copy the commands from GitHub (they'll look like this):

```bash
git remote add origin https://github.com/YOUR_USERNAME/rackspace-customer-dashboard.git
git branch -M main
git push -u origin main
```

### Step 4: Enable GitHub Pages
1. Go to repository **Settings** → **Pages**
2. Source: Branch `main`, folder `/ (root)`
3. Click **Save**

### Step 5: Access Your Dashboard
```
https://YOUR_USERNAME.github.io/rackspace-customer-dashboard/
```

---

## Important: Rename dashboard.html to index.html

GitHub Pages looks for `index.html` as the default page. You need to rename your file:

**Windows Command:**
```bash
ren dashboard.html index.html
```

**Or manually:**
1. Right-click `dashboard.html`
2. Rename to `index.html`

---

## File Structure for GitHub Repository

```
rackspace-customer-dashboard/
├── index.html                          (renamed from dashboard.html)
├── data_export_flat_array.json        (your data file)
├── sample_data.csv                    (optional)
├── README.md                          (optional - repository description)
└── GITHUB_PAGES_SETUP.md             (this guide)
```

---

## Auto-Loading Data from GitHub

The dashboard is now configured to automatically load `data_export_flat_array.json` when the page loads. This means:

✓ No need to upload the file every time
✓ Data loads automatically when you visit the page
✓ You can still manually upload different files if needed
✓ Click "Load Default Data" button to reload the JSON file

---

## Updating Your Data

### Method 1: GitHub Web Interface
1. Go to your repository
2. Click on `data_export_flat_array.json`
3. Click the pencil icon (Edit)
4. Paste your new JSON data
5. Commit changes
6. Wait 1-2 minutes for GitHub Pages to update

### Method 2: Git Command Line
```bash
# Make changes to data_export_flat_array.json
# Then commit and push:

git add data_export_flat_array.json
git commit -m "Update customer data"
git push
```

---

## Troubleshooting

### Dashboard shows "Please upload a CSV or JSON file"
- Make sure `data_export_flat_array.json` is in the same folder as `index.html`
- Check browser console (F12) for errors
- Verify the JSON file is valid

### GitHub Pages not working
- Ensure repository is **Public**
- Wait 2-5 minutes after enabling Pages
- Check Settings → Pages for deployment status
- Clear browser cache and try again

### 404 Error
- Make sure you renamed `dashboard.html` to `index.html`
- Check the URL matches: `https://USERNAME.github.io/REPO-NAME/`

### Data not updating
- GitHub Pages can take 1-5 minutes to update
- Clear browser cache (Ctrl+F5)
- Check if changes are visible in the repository

---

## Security Considerations

⚠️ **Important:** GitHub Pages repositories are PUBLIC. This means:
- Anyone can view your dashboard
- Anyone can download your JSON data file
- Do NOT include sensitive information like:
  - Passwords or API keys
  - Personal customer information (PII)
  - Internal company secrets
  - Financial details beyond what's appropriate for public view

### If you need privacy:
1. Use a **Private repository** (requires GitHub Pro)
2. Host on internal company servers
3. Add authentication layer
4. Use environment variables for sensitive data

---

## Custom Domain (Optional)

If you want to use your own domain (e.g., `dashboard.rackspace.com`):

1. Buy a domain from a registrar
2. Add a `CNAME` file to your repository with your domain
3. Configure DNS settings at your registrar
4. Update GitHub Pages settings with custom domain

---

## Next Steps

1. ✅ Rename `dashboard.html` to `index.html`
2. ✅ Create GitHub repository
3. ✅ Upload files (including `data_export_flat_array.json`)
4. ✅ Enable GitHub Pages
5. ✅ Share the URL with your team!

Your dashboard will automatically load the data from `data_export_flat_array.json` every time someone visits the page.

---

## Quick Commands Summary

```bash
# Navigate to folder
cd "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard"

# Rename file
ren dashboard.html index.html

# Initialize and push to GitHub
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/rackspace-customer-dashboard.git
git branch -M main
git push -u origin main
```

Then enable GitHub Pages in repository settings!
