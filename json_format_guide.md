# JSON Format Guide for Dashboard

## Currently Supported Format
The dashboard currently only accepts **CSV files**.

## JSON Formats That Can Be Supported

### 1. Flat JSON (Array of Objects) - RECOMMENDED ✓

This is the most common and easiest format to work with.

```json
[
  {
    "Top Company Name": "Acme Corporation",
    "Account Name": "Acme Corp Main",
    "Account Number": "ACC001",
    "Device Number": "DEV001",
    "Device Type": "Server",
    "Device Make Model": "Dell PowerEdge R740",
    "device_host_name": "srv-prod-01",
    "CSM Manager": "John Smith",
    "CSM": "Jane Doe",
    "Segment": "Enterprise",
    "Contract Length": "36 months",
    "Contractible Flag": "Yes",
    "Contract Status": "Active",
    "Device Status": "Online",
    "Contract End Date": "2026-12-31",
    "Contract Expiry Group": "Q4 2026",
    "Device CMRR $": "5000.00"
  },
  {
    "Top Company Name": "TechStart Inc",
    "Account Name": "TechStart Primary",
    "Account Number": "ACC002",
    "Device Number": "DEV002",
    "Device Type": "Storage",
    "Device Make Model": "NetApp FAS8200",
    "device_host_name": "storage-main-01",
    "CSM Manager": "John Smith",
    "CSM": "Bob Johnson",
    "Segment": "Commercial",
    "Contract Length": "24 months",
    "Contractible Flag": "Yes",
    "Contract Status": "Active",
    "Device Status": "Online",
    "Contract End Date": "2026-06-30",
    "Contract Expiry Group": "Q2 2026",
    "Device CMRR $": "3500.00"
  }
]
```

**Pros:**
- Simple and direct
- Easy to parse
- No transformation needed
- Works perfectly with dashboard table structure

---

### 2. Grouped JSON (Nested by Account)

Data grouped by account with devices as nested arrays.

```json
{
  "accounts": [
    {
      "accountInfo": {
        "Top Company Name": "Acme Corporation",
        "Account Name": "Acme Corp Main",
        "Account Number": "ACC001",
        "CSM Manager": "John Smith",
        "Segment": "Enterprise"
      },
      "devices": [
        {
          "Device Number": "DEV001",
          "Device Type": "Server",
          "Device Make Model": "Dell PowerEdge R740",
          "device_host_name": "srv-prod-01",
          "CSM": "Jane Doe",
          "Contract Length": "36 months",
          "Contractible Flag": "Yes",
          "Contract Status": "Active",
          "Device Status": "Online",
          "Contract End Date": "2026-12-31",
          "Contract Expiry Group": "Q4 2026",
          "Device CMRR $": "5000.00"
        },
        {
          "Device Number": "DEV004",
          "Device Type": "Server",
          "Device Make Model": "HP ProLiant DL380",
          "device_host_name": "srv-dr-01",
          "CSM": "Jane Doe",
          "Contract Length": "36 months",
          "Contractible Flag": "Yes",
          "Contract Status": "Active",
          "Device Status": "Standby",
          "Contract End Date": "2026-12-31",
          "Contract Expiry Group": "Q4 2026",
          "Device CMRR $": "4500.00"
        }
      ]
    }
  ]
}
```

**Pros:**
- Logical grouping
- Reduces data redundancy
- Better for hierarchical data

**Cons:**
- Requires flattening before display
- More complex parsing

---

### 3. Wrapped JSON (With Metadata)

JSON with metadata wrapper around the data array.

```json
{
  "metadata": {
    "source": "Rackspace Customer Database",
    "generated": "2026-03-05T10:30:00Z",
    "recordCount": 10,
    "version": "1.0"
  },
  "data": [
    {
      "Top Company Name": "Acme Corporation",
      "Account Name": "Acme Corp Main",
      "Account Number": "ACC001",
      "Device Number": "DEV001",
      "Device Type": "Server",
      "Device Make Model": "Dell PowerEdge R740",
      "device_host_name": "srv-prod-01",
      "CSM Manager": "John Smith",
      "CSM": "Jane Doe",
      "Segment": "Enterprise",
      "Contract Length": "36 months",
      "Contractible Flag": "Yes",
      "Contract Status": "Active",
      "Device Status": "Online",
      "Contract End Date": "2026-12-31",
      "Contract Expiry Group": "Q4 2026",
      "Device CMRR $": "5000.00"
    }
  ]
}
```

**Pros:**
- Can include additional context
- Good for API responses
- Versioning support

**Cons:**
- Need to extract data array
- Extra parsing step

---

### 4. Key-Value JSON (Object of Objects)

Each record identified by a unique key.

```json
{
  "DEV001": {
    "Top Company Name": "Acme Corporation",
    "Account Name": "Acme Corp Main",
    "Account Number": "ACC001",
    "Device Number": "DEV001",
    "Device Type": "Server",
    "Device Make Model": "Dell PowerEdge R740",
    "device_host_name": "srv-prod-01",
    "CSM Manager": "John Smith",
    "CSM": "Jane Doe",
    "Segment": "Enterprise",
    "Contract Length": "36 months",
    "Contractible Flag": "Yes",
    "Contract Status": "Active",
    "Device Status": "Online",
    "Contract End Date": "2026-12-31",
    "Contract Expiry Group": "Q4 2026",
    "Device CMRR $": "5000.00"
  },
  "DEV002": {
    "Top Company Name": "TechStart Inc",
    "Account Name": "TechStart Primary",
    "Account Number": "ACC002",
    "Device Number": "DEV002",
    "Device Type": "Storage",
    "Device Make Model": "NetApp FAS8200",
    "device_host_name": "storage-main-01",
    "CSM Manager": "John Smith",
    "CSM": "Bob Johnson",
    "Segment": "Commercial",
    "Contract Length": "24 months",
    "Contractible Flag": "Yes",
    "Contract Status": "Active",
    "Device Status": "Online",
    "Contract End Date": "2026-06-30",
    "Contract Expiry Group": "Q2 2026",
    "Device CMRR $": "3500.00"
  }
}
```

**Pros:**
- Fast lookups by key
- Good for updates

**Cons:**
- Need to convert to array
- Less common format

---

### 5. Columnar JSON (Column-Oriented)

Data organized by columns rather than rows.

```json
{
  "Top Company Name": ["Acme Corporation", "TechStart Inc", "Global Systems"],
  "Account Name": ["Acme Corp Main", "TechStart Primary", "Global Sys East"],
  "Account Number": ["ACC001", "ACC002", "ACC003"],
  "Device Number": ["DEV001", "DEV002", "DEV003"],
  "Device Type": ["Server", "Storage", "Network"],
  "Device Make Model": ["Dell PowerEdge R740", "NetApp FAS8200", "Cisco Nexus 9000"],
  "device_host_name": ["srv-prod-01", "storage-main-01", "net-core-01"],
  "CSM Manager": ["John Smith", "John Smith", "Sarah Williams"],
  "CSM": ["Jane Doe", "Bob Johnson", "Mike Davis"],
  "Segment": ["Enterprise", "Commercial", "Enterprise"],
  "Contract Length": ["36 months", "24 months", "48 months"],
  "Contractible Flag": ["Yes", "Yes", "No"],
  "Contract Status": ["Active", "Active", "Active"],
  "Device Status": ["Online", "Online", "Online"],
  "Contract End Date": ["2026-12-31", "2026-06-30", "2027-03-31"],
  "Contract Expiry Group": ["Q4 2026", "Q2 2026", "Q1 2027"],
  "Device CMRR $": ["5000.00", "3500.00", "7500.00"]
}
```

**Pros:**
- Efficient for analytics
- Smaller file size
- Good for data science applications

**Cons:**
- Requires transposition
- Less intuitive

---

## Recommendation for Your Dashboard

### Best Format: **Flat JSON (Array of Objects)**

This is the most straightforward format and requires minimal transformation:

```json
[
  {
    "Top Company Name": "...",
    "Account Name": "...",
    ...
  }
]
```

### Why?
1. Direct mapping to table rows
2. Easy to filter and process
3. Standard format for most APIs
4. No flattening or transformation needed
5. Works with existing dashboard logic

---

## Implementation Notes

If you want JSON support added to the dashboard, I can:

1. **Add JSON file upload** alongside CSV
2. **Support multiple JSON formats** with auto-detection
3. **Add format validation** to show helpful error messages
4. **Convert grouped/nested JSON** to flat format automatically

Would you like me to add JSON upload support to the dashboard?
