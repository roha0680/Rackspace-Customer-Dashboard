# Local Testing Guide

## Why Auto-Load Doesn't Work Locally

When you open `index.html` directly in your browser (double-click), it uses the `file://` protocol. Browsers block JavaScript from loading other files for security reasons (CORS policy). This is normal and expected.

**Good news:** Auto-load will work perfectly once deployed to GitHub Pages!

## Solution: Run a Local Web Server

You have 3 options to test locally with auto-load:

---

## Option 1: Use the Batch File (Easiest)

1. Double-click `start-local-server.bat`
2. A command window will open showing: `http://localhost:8000`
3. Open your browser and go to: `http://localhost:8000`
4. The dashboard will load with data automatically!
5. Press `Ctrl+C` in the command window to stop the server

**Requirements:** Python must be installed (check with `python --version`)

---

## Option 2: Python Command (Manual)

Open PowerShell or Command Prompt in this folder and run:

```bash
python -m http.server 8000
```

Then open: `http://localhost:8000`

---

## Option 3: Node.js (If you have Node installed)

Install a simple server:
```bash
npm install -g http-server
```

Run it:
```bash
http-server -p 8000
```

Then open: `http://localhost:8000`

---

## Option 4: VS Code Live Server Extension

If you use VS Code:
1. Install "Live Server" extension
2. Right-click `index.html`
3. Select "Open with Live Server"
4. Auto-load will work!

---

## Option 5: Just Upload the File Manually

For quick testing without a server:
1. Open `index.html` in your browser
2. Click the file upload button
3. Select `data_export_flat_array.json`
4. Data will load normally

---

## Testing Checklist

When testing locally with a web server:

- [ ] Server is running (see `http://localhost:8000` in terminal)
- [ ] Open browser to `http://localhost:8000` (not `file://`)
- [ ] Dashboard loads
- [ ] Status message shows "✓ Default data loaded successfully!"
- [ ] Summary cards show data (not zeros)
- [ ] Table shows customer records
- [ ] Filters are populated

---

## Troubleshooting

### "python: command not found"
Install Python from: https://www.python.org/downloads/

### Port 8000 already in use
Try a different port:
```bash
python -m http.server 8001
```
Then open: `http://localhost:8001`

### Still not working?
Just upload the file manually for now. Auto-load will work perfectly on GitHub Pages!

---

## Remember

✅ **On GitHub Pages:** Auto-load works perfectly (no server needed)
⚠️ **Opening file directly:** Auto-load blocked by browser (use manual upload)
✅ **With local server:** Auto-load works perfectly

The dashboard is production-ready for GitHub Pages deployment!
