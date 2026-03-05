# Ways to Connect Dashboard to Online Excel Sheet

## Option 1: Microsoft Excel Online (OneDrive/SharePoint) via Microsoft Graph API

### Setup Steps:
1. **Register Application in Azure AD**
   - Go to [Azure Portal](https://portal.azure.com)
   - Navigate to Azure Active Directory → App registrations → New registration
   - Name: "Rackspace Dashboard"
   - Supported account types: Single tenant
   - Redirect URI: Web → `http://localhost` (or your domain)
   - Click Register

2. **Configure API Permissions**
   - Go to API permissions → Add a permission
   - Select Microsoft Graph → Delegated permissions
   - Add: `Files.Read`, `Files.Read.All`, `Sites.Read.All`
   - Grant admin consent

3. **Get Client ID and Create Client Secret**
   - Copy the Application (client) ID
   - Go to Certificates & secrets → New client secret
   - Copy the secret value immediately

4. **Get Your Excel File Information**
   - Upload Excel file to OneDrive or SharePoint
   - Get the file's Drive ID and Item ID (can be found via Graph Explorer)
   - Or use the file path

### Implementation Code:
```javascript
// Authentication using MSAL.js
const msalConfig = {
    auth: {
        clientId: 'YOUR_CLIENT_ID',
        authority: 'https://login.microsoftonline.com/YOUR_TENANT_ID',
        redirectUri: 'http://localhost'
    }
};

const msalInstance = new msal.PublicClientApplication(msalConfig);

// Get access token
async function getToken() {
    const loginRequest = {
        scopes: ['Files.Read', 'Sites.Read.All']
    };
    const response = await msalInstance.loginPopup(loginRequest);
    return response.accessToken;
}

// Fetch Excel data
async function fetchExcelData() {
    const token = await getToken();
    const driveId = 'YOUR_DRIVE_ID';
    const itemId = 'YOUR_ITEM_ID';
    const worksheetName = 'Sheet1';
    
    const url = `https://graph.microsoft.com/v1.0/drives/${driveId}/items/${itemId}/workbook/worksheets/${worksheetName}/usedRange`;
    
    const response = await fetch(url, {
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    });
    
    const data = await response.json();
    return data.values; // Returns 2D array
}
```

---

## Option 2: Excel Online via Public Link (Read-Only, No Auth)

### Setup Steps:
1. **Upload Excel to OneDrive**
2. **Share the file**
   - Right-click file → Share
   - Set to "Anyone with the link can view"
   - Copy the sharing link

3. **Convert to Embed URL**
   - Original: `https://onedrive.live.com/view.aspx?resid=ABC123&ithint=file%2cxlsx`
   - Embed: `https://onedrive.live.com/download?resid=ABC123&ithint=file%2cxlsx`

### Implementation Code:
```javascript
async function loadExcelFromOneDrive() {
    const shareUrl = 'YOUR_ONEDRIVE_SHARE_URL';
    const downloadUrl = shareUrl.replace('/view.aspx', '/download');
    
    const response = await fetch(downloadUrl);
    const blob = await response.blob();
    
    // Use SheetJS (xlsx) library to parse
    const reader = new FileReader();
    reader.onload = function(e) {
        const data = new Uint8Array(e.target.result);
        const workbook = XLSX.read(data, {type: 'array'});
        const firstSheet = workbook.Sheets[workbook.SheetNames[0]];
        const jsonData = XLSX.utils.sheet_to_json(firstSheet, {header: 1});
        processData(jsonData);
    };
    reader.readAsArrayBuffer(blob);
}
```

---

## Option 3: Google Sheets (Easiest Option)

### Setup Steps:
1. **Upload Excel to Google Drive**
   - Convert to Google Sheets format

2. **Enable Google Sheets API**
   - Go to [Google Cloud Console](https://console.cloud.google.com)
   - Create project → Enable Google Sheets API
   - Create API Key

3. **Make Sheet Public**
   - Share → Anyone with link can view

### Implementation Code:
```javascript
async function loadFromGoogleSheets() {
    const sheetId = 'YOUR_SHEET_ID';
    const apiKey = 'YOUR_API_KEY';
    const sheetName = 'Sheet1';
    
    const url = `https://sheets.googleapis.com/v4/spreadsheets/${sheetId}/values/${sheetName}?key=${apiKey}`;
    
    const response = await fetch(url);
    const data = await response.json();
    return data.values; // Returns 2D array
}
```

---

## Option 4: SharePoint Online with Direct REST API

### Setup Steps:
1. **Upload Excel to SharePoint**
2. **Get Site URL and File Path**
3. **Use SharePoint REST API with authentication**

### Implementation Code:
```javascript
async function loadFromSharePoint() {
    const siteUrl = 'https://yourtenant.sharepoint.com/sites/yoursite';
    const filePath = '/Shared Documents/data.xlsx';
    const token = await getSharePointToken(); // Use Azure AD auth
    
    const url = `${siteUrl}/_api/web/GetFileByServerRelativeUrl('${filePath}')/$value`;
    
    const response = await fetch(url, {
        headers: {
            'Authorization': `Bearer ${token}`,
            'Accept': 'application/json;odata=verbose'
        }
    });
    
    const blob = await response.blob();
    // Parse with SheetJS
}
```

---

## Option 5: Excel Online via Office Scripts (Power Automate)

### Setup Steps:
1. **Create Office Script in Excel Online**
   - Open Excel Online → Automate → New Script
   - Script to export data as JSON

2. **Create Power Automate Flow**
   - Trigger: Recurrence (every X minutes)
   - Action: Run Office Script
   - Action: HTTP POST to webhook/API endpoint

3. **Create Simple API Endpoint**
   - Use Azure Functions, AWS Lambda, or simple Node.js server
   - Store latest data in memory or database

### Office Script Example:
```typescript
function main(workbook: ExcelScript.Workbook) {
    const sheet = workbook.getActiveWorksheet();
    const range = sheet.getUsedRange();
    const values = range.getValues();
    return JSON.stringify(values);
}
```

---

## Option 6: Third-Party Integration Services

### Services that can help:
1. **Zapier**
   - Connect Excel Online → Webhook
   - Trigger on row changes
   - Send data to your dashboard endpoint

2. **Make (formerly Integromat)**
   - Similar to Zapier
   - More affordable for high-volume

3. **n8n (Self-hosted)**
   - Open-source automation
   - Connect Excel → Your API

---

## Recommended Approach for Your Use Case

### Best Option: Google Sheets (Simplest)
**Pros:**
- No complex authentication
- Simple API
- Free tier is generous
- Real-time updates
- Easy to set up

**Cons:**
- Need to convert Excel to Google Sheets
- Requires Google account

### Second Best: Microsoft Graph API
**Pros:**
- Native Excel support
- No conversion needed
- Enterprise-grade security

**Cons:**
- Complex authentication setup
- Requires Azure AD
- More development effort

---

## Quick Start Recommendation

1. **For immediate testing:** Use Google Sheets
   - Convert your Excel file to Google Sheets
   - Use the dashboard_with_db.html I created earlier
   - Follow the built-in instructions

2. **For production with Excel:** Use Microsoft Graph API
   - More setup but native Excel support
   - Better for enterprise environments
   - I can create a version with Graph API integration

Would you like me to create a dashboard version with any of these specific integrations?
