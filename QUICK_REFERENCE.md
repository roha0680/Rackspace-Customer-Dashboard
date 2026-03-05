# Quick Reference Card

## 🚀 Push Changes to GitHub (Choose One)

### Method 1: Automated Script
```
Double-click: push-to-github.bat
```

### Method 2: Git Commands
```bash
git add .
git commit -m "Update dashboard"
git push
```

### Method 3: GitHub Web
1. Go to your repository
2. Upload/edit files manually
3. Commit changes

---

## 🧪 Test Locally (Choose One)

### Method 1: Batch File
```
Double-click: start-local-server.bat
Then open: http://localhost:8000
```

### Method 2: Python Command
```bash
python -m http.server 8000
Then open: http://localhost:8000
```

### Method 3: Manual Upload
```
Open index.html in browser
Upload data_export_flat_array.json manually
```

---

## 📊 Update Customer Data

### On GitHub:
1. Click `data_export_flat_array.json`
2. Edit (pencil icon)
3. Paste new data
4. Commit

### Locally:
1. Edit `data_export_flat_array.json`
2. Run `push-to-github.bat`
3. Wait 1-2 minutes

---

## 🔗 Important URLs

- **Your Dashboard:** `https://YOUR_USERNAME.github.io/REPO_NAME/`
- **Repository:** `https://github.com/YOUR_USERNAME/REPO_NAME`
- **Settings:** `https://github.com/YOUR_USERNAME/REPO_NAME/settings/pages`

---

## 📁 Key Files

| File | Purpose |
|------|---------|
| `index.html` | Main dashboard |
| `data_export_flat_array.json` | Auto-loaded data |
| `push-to-github.bat` | Push changes |
| `start-local-server.bat` | Test locally |

---

## ⚡ Common Commands

```bash
# Check status
git status

# Push changes
git add .
git commit -m "Update"
git push

# Start local server
python -m http.server 8000

# Check Python version
python --version
```

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| Auto-load fails locally | Use `start-local-server.bat` |
| Git push fails | Check credentials, see UPDATE_GITHUB.md |
| Data not updating | Wait 2 minutes, clear browser cache |
| 404 error | Check file is named `index.html` |

---

## 📚 Documentation

- **Quick Start:** `QUICK_START.md`
- **Update Guide:** `UPDATE_GITHUB.md`
- **Local Testing:** `LOCAL_TESTING.md`
- **Changes:** `CHANGES_SUMMARY.md`
- **Full Setup:** `GITHUB_PAGES_SETUP.md`

---

## ✅ Success Indicators

### Local Testing:
- ✓ Server shows: `Serving HTTP on :: port 8000`
- ✓ Dashboard shows: "✓ Default data loaded successfully!"
- ✓ Table displays customer records

### GitHub Pages:
- ✓ Settings → Pages shows: "Your site is live"
- ✓ Dashboard URL loads without errors
- ✓ Data loads automatically
- ✓ All filters work

---

## 🎯 Quick Wins

1. **Test Now:** `start-local-server.bat` → `http://localhost:8000`
2. **Push Now:** `push-to-github.bat`
3. **Share Now:** Send your GitHub Pages URL to team

That's it! 🎉
