# 🚀 Quick Start Guide

## What You Have

A fully functional Rackspace Customer Dashboard that:
- ✅ Automatically loads your data from `data_export_flat_array.json`
- ✅ Shows summary metrics (Total Accounts, Devices, MRR)
- ✅ Has 8 multi-select filters
- ✅ Supports both CSV and JSON uploads
- ✅ Dark mode interface
- ✅ Ready to deploy to GitHub Pages

## 3-Minute Deploy to GitHub Pages

### Option A: No Git Commands (Easiest)

1. **Create GitHub Repository**
   - Go to https://github.com/new
   - Name: `rackspace-customer-dashboard`
   - Make it **Public**
   - Click **Create repository**

2. **Upload Files**
   - Click **uploading an existing file**
   - Drag all files from this folder
   - Click **Commit changes**

3. **Enable GitHub Pages**
   - Go to **Settings** → **Pages**
   - Source: Branch `main`, Folder `/ (root)`
   - Click **Save**

4. **Done!**
   - Your dashboard will be at: `https://YOUR_USERNAME.github.io/rackspace-customer-dashboard/`
   - Wait 2 minutes for deployment

### Option B: Using Git Commands

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/rackspace-customer-dashboard.git
git branch -M main
git push -u origin main
```

Then enable GitHub Pages in Settings.

## Testing Locally

Just open `index.html` in your browser. The data will load automatically!

## Updating Your Data

### On GitHub (No Git)
1. Go to your repository
2. Click `data_export_flat_array.json`
3. Click the pencil icon (Edit)
4. Paste new JSON data
5. Commit changes
6. Wait 1-2 minutes

### Using Git
```bash
# Edit data_export_flat_array.json
git add data_export_flat_array.json
git commit -m "Update data"
git push
```

## Files in This Folder

| File | Purpose |
|------|---------|
| `index.html` | Main dashboard (renamed from dashboard.html) |
| `data_export_flat_array.json` | Your customer data (auto-loads) |
| `sample_data.csv` | Sample data for testing |
| `README.md` | Repository documentation |
| `GITHUB_PAGES_SETUP.md` | Detailed setup guide |
| `deploy-to-github.md` | Step-by-step deploy commands |
| `connection_guide.md` | Connect to online Excel/Sheets |
| `json_format_guide.md` | JSON format specifications |
| `.gitignore` | Files to exclude from Git |

## Dashboard Features

### Summary Cards
- Total Accounts (unique count)
- Total Devices (row count)
- Sum of MRR in millions

### Filters (Multi-Select)
1. Device Type
2. Device Make Model
3. Segment
4. Contract Length
5. Contractible Flag
6. Contract Status
7. Device Status
8. Contract Expiry Group

### Data Upload
- Auto-loads `data_export_flat_array.json` on page load
- Manual upload: CSV or JSON files
- Button to reload default data

## Important Notes

⚠️ **Security**: GitHub Pages is PUBLIC. Don't include:
- Passwords or API keys
- Sensitive customer information
- Confidential data

✅ **Data Format**: Your JSON file is perfect (flat array of objects)

🔄 **Updates**: Changes to JSON file take 1-2 minutes to reflect on GitHub Pages

## Need More Help?

- **Detailed Setup**: See `GITHUB_PAGES_SETUP.md`
- **Deploy Commands**: See `deploy-to-github.md`
- **Connect to Excel**: See `connection_guide.md`
- **JSON Formats**: See `json_format_guide.md`

## Support

The dashboard is ready to use! Just:
1. Deploy to GitHub Pages (3 minutes)
2. Share the URL with your team
3. Update data as needed

Your data will automatically load every time someone visits the dashboard!
