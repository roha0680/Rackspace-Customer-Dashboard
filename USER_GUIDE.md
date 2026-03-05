# Rackspace Customer Dashboard - User Guide

## 🌐 Access the Dashboard

**Live URL:** https://roha0680.github.io/Rackspace-Customer-Dashboard/

---

## 📊 How to Use the Dashboard

### Step 1: Upload Data

1. **Download the data file:**
   - Go to: https://github.com/roha0680/Rackspace-Customer-Dashboard/releases/tag/data-v1.0
   - Click on `data_export_flat_array.json` to download (38MB)

2. **Upload to dashboard:**
   - Open the dashboard URL
   - Click the file upload button
   - Select the downloaded `data_export_flat_array.json`
   - Data will load automatically

### Step 2: View Summary

Once data is loaded, you'll see three summary cards:
- **Total Accounts** - Unique customer accounts
- **Total Devices** - Total number of devices
- **Sum of MRR (Millions)** - Monthly Recurring Revenue in millions

### Step 3: Use Filters

The dashboard has 8 multi-select filters:
1. Device Type
2. Device Make Model
3. Segment
4. Contract Length
5. Contractible Flag
6. Contract Status
7. Device Status
8. Contract Expiry Group

**To filter:**
- Click any filter dropdown
- Check multiple options
- Dashboard updates automatically
- Click "Clear All Filters" to reset

### Step 4: View Data Table

The table shows all customer records with 17 columns:
- Top Company Name
- Account Name
- Account Number
- Device Number
- Device Type
- Device Make Model
- Device Host Name
- CSM Manager
- CSM
- Segment
- Contract Length
- Contractible Flag
- Contract Status
- Device Status
- Contract End Date
- Contract Expiry Group
- Device CMRR $

---

## 🔄 Updating Data

### For Administrators:

**Option 1: Replace file in existing release (Easiest)**
1. Go to: https://github.com/roha0680/Rackspace-Customer-Dashboard/releases/tag/data-v1.0
2. Edit the release
3. Delete the old `data_export_flat_array.json`
4. Upload the new file (same name)
5. Save release
6. Users download the new file and upload to dashboard

**Option 2: Create new release**
1. Go to: https://github.com/roha0680/Rackspace-Customer-Dashboard/releases/new
2. Tag: `data-v1.1` (increment version)
3. Upload new `data_export_flat_array.json`
4. Publish release
5. Update the link in the dashboard instructions

---

## 💡 Tips

- **Bookmark the dashboard URL** for quick access
- **Download the latest data file** from GitHub Releases
- **Use filters** to analyze specific segments
- **Hover over table cells** to see full content
- **Clear filters** to see all data again

---

## 🐛 Troubleshooting

### Data not loading
- Make sure you downloaded the correct file from GitHub Releases
- Check file size (should be ~38MB)
- Try refreshing the page and uploading again

### Filters not working
- Make sure data is loaded first
- Try clearing all filters and reapplying

### Table not displaying
- Check browser console for errors (F12)
- Try a different browser (Chrome recommended)
- Clear browser cache

---

## 📱 Browser Support

- ✅ Chrome (Recommended)
- ✅ Firefox
- ✅ Edge
- ✅ Safari

---

## 🔒 Security Note

This dashboard is publicly accessible. Do not include sensitive personal information in the data file.

---

## 📞 Support

For issues or questions:
- Check the repository: https://github.com/roha0680/Rackspace-Customer-Dashboard
- Review documentation files in the repository
- Contact the dashboard administrator

---

## 🎯 Quick Start

1. Open: https://roha0680.github.io/Rackspace-Customer-Dashboard/
2. Download data: https://github.com/roha0680/Rackspace-Customer-Dashboard/releases/tag/data-v1.0
3. Upload the JSON file
4. Start analyzing!

That's it! Enjoy using the dashboard. 🚀
