# Rackspace Enterprise/Commercial Customer Dashboard

An executive-level dashboard for viewing and analyzing Rackspace Enterprise and Commercial customer accounts.

## Features

- 📊 **Summary Cards**: Total Accounts, Total Devices, Sum of MRR (in millions)
- 🔍 **Advanced Filtering**: Multi-select filters for 8 different data dimensions
- 📁 **Flexible Data Import**: Support for both CSV and JSON file formats
- 🎨 **Dark Mode Interface**: Modern, professional dark theme
- 🔄 **Auto-Load Data**: Automatically loads default data on page load
- 📱 **Responsive Design**: Works on desktop and tablet devices

## Live Demo

🚀 **[View Dashboard](https://roha0680.github.io/Rackspace-Customer-Dashboard/)**

## Dashboard Columns

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

## Available Filters

The dashboard includes multi-select dropdown filters for:

1. Device Type
2. Device Make Model
3. Segment
4. Contract Length
5. Contractible Flag
6. Contract Status
7. Device Status
8. Contract Expiry Group

## Usage

### Automatic Data Loading
The dashboard automatically loads data from `data_export_flat_array.json` when the page opens.

### Manual File Upload
You can also upload your own CSV or JSON files:
1. Click the file upload button
2. Select a CSV or JSON file
3. Data will be parsed and displayed automatically

### Filtering Data
1. Click any filter dropdown
2. Select multiple options using checkboxes
3. Dashboard updates automatically
4. Click "Clear All Filters" to reset

## Data Format

### JSON Format (Recommended)
```json
[
  {
    "Top Company Name": "Company Name",
    "Account Name": "Account Name",
    "Account Number": "ACC001",
    "Device Number": "DEV001",
    "Device Type": "Server",
    ...
  }
]
```

### CSV Format
Standard CSV with headers matching the column names above.

## Updating Data

### Option 1: GitHub Web Interface
1. Navigate to `data_export_flat_array.json` in the repository
2. Click the edit (pencil) icon
3. Update the JSON data
4. Commit changes
5. Wait 1-2 minutes for GitHub Pages to update

### Option 2: Git Command Line
```bash
# Update the JSON file locally
# Then commit and push:
git add data_export_flat_array.json
git commit -m "Update customer data"
git push
```

## Local Development

To run locally:
1. Clone the repository
2. Open `index.html` in a web browser
3. The dashboard will automatically load `data_export_flat_array.json`

## Files

- `index.html` - Main dashboard file
- `data_export_flat_array.json` - Default customer data
- `sample_data.csv` - Sample CSV data for testing
- `GITHUB_PAGES_SETUP.md` - Detailed setup instructions
- `connection_guide.md` - Guide for connecting to online data sources
- `json_format_guide.md` - JSON format specifications

## Browser Support

- Chrome (recommended)
- Firefox
- Edge
- Safari

## Security Note

⚠️ This repository is public. Do not include sensitive information such as:
- Personal customer information (PII)
- Passwords or API keys
- Internal company secrets
- Confidential financial data

## License

Internal use only - Rackspace Technology

## Support

For issues or questions, please contact the dashboard administrator.
