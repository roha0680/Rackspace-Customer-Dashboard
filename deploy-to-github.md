# Quick Deploy to GitHub Pages

## Step-by-Step Commands

### 1. Open Git Bash or PowerShell in this folder

Right-click in the folder and select "Git Bash Here" or "Open PowerShell Here"

### 2. Run these commands one by one:

```bash
# Initialize git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Rackspace Customer Dashboard"
```

### 3. Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `rackspace-customer-dashboard`
3. Description: "Rackspace Enterprise/Commercial Customer Dashboard"
4. Select **Public**
5. **DO NOT** check "Initialize with README"
6. Click **Create repository**

### 4. Connect and Push to GitHub

Replace `YOUR_USERNAME` with your actual GitHub username:

```bash
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/rackspace-customer-dashboard.git

# Rename branch to main
git branch -M main

# Push to GitHub
git push -u origin main
```

### 5. Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Click **Pages** in the left sidebar
4. Under **Source**:
   - Branch: `main`
   - Folder: `/ (root)`
5. Click **Save**
6. Wait 1-2 minutes

### 6. Access Your Dashboard

Your dashboard will be live at:
```
https://YOUR_USERNAME.github.io/rackspace-customer-dashboard/
```

## Updating Data Later

When you need to update the data:

```bash
# Edit data_export_flat_array.json with your new data
# Then run:

git add data_export_flat_array.json
git commit -m "Update customer data - [DATE]"
git push
```

Wait 1-2 minutes and refresh your dashboard page.

## Troubleshooting

### "git: command not found"
Install Git from: https://git-scm.com/download/win

### Authentication Required
GitHub may ask for credentials. Use:
- Username: Your GitHub username
- Password: Personal Access Token (not your GitHub password)

To create a token:
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token
3. Select scopes: `repo`
4. Copy and save the token

### Permission Denied
Make sure you're using the correct repository URL with your username.

## Files Being Uploaded

✅ index.html (main dashboard)
✅ data_export_flat_array.json (your data)
✅ sample_data.csv (sample data)
✅ README.md (repository description)
✅ GITHUB_PAGES_SETUP.md (setup guide)
✅ connection_guide.md (data connection guide)
✅ json_format_guide.md (JSON format guide)
✅ .gitignore (files to ignore)

## Success Checklist

- [ ] Git repository initialized
- [ ] Files committed locally
- [ ] GitHub repository created
- [ ] Code pushed to GitHub
- [ ] GitHub Pages enabled
- [ ] Dashboard accessible via URL
- [ ] Data loads automatically

## Need Help?

Refer to `GITHUB_PAGES_SETUP.md` for detailed instructions with screenshots and troubleshooting.
