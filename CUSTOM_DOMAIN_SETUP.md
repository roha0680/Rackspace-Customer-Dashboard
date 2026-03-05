# Custom Domain Setup for GitHub Pages

## Current Domain
`https://roha0680.github.io/Rackspace-Customer-Dashboard/`

## Options to Change Domain

### Option 1: Use a Custom Domain (Recommended)
Use your own domain like `dashboard.yourcompany.com` or `rackspace-dashboard.com`

### Option 2: Change GitHub Username
Changes `roha0680.github.io` to `newusername.github.io` (affects all your repos)

### Option 3: Use a Subdomain
Keep GitHub but use `dashboard.roha0680.github.io` (requires GitHub Pro)

---

## Option 1: Custom Domain Setup (RECOMMENDED)

### Step 1: Purchase a Domain
Buy a domain from a registrar:
- **Namecheap** - https://www.namecheap.com (~$10-15/year)
- **GoDaddy** - https://www.godaddy.com
- **Google Domains** - https://domains.google
- **Cloudflare** - https://www.cloudflare.com/products/registrar/

Example domains:
- `rackspace-dashboard.com`
- `customer-dashboard.com`
- `yourcompany-dashboard.com`

### Step 2: Configure DNS Settings

Go to your domain registrar's DNS management and add these records:

#### For Root Domain (e.g., `dashboard.com`):
```
Type: A
Name: @
Value: 185.199.108.153

Type: A
Name: @
Value: 185.199.109.153

Type: A
Name: @
Value: 185.199.110.153

Type: A
Name: @
Value: 185.199.111.153
```

#### For Subdomain (e.g., `dashboard.yourcompany.com`):
```
Type: CNAME
Name: dashboard
Value: roha0680.github.io
```

### Step 3: Add Custom Domain to GitHub

1. Go to your repository: https://github.com/roha0680/Rackspace-Customer-Dashboard
2. Click **Settings**
3. Scroll to **Pages** section
4. Under **Custom domain**, enter your domain:
   - `dashboard.yourcompany.com` OR
   - `yourdomain.com`
5. Click **Save**
6. Check **Enforce HTTPS** (wait 24 hours for SSL certificate)

### Step 4: Add CNAME File to Repository

Create a file named `CNAME` (no extension) in your repository root:

```
dashboard.yourcompany.com
```

Or run this command:
```bash
echo "dashboard.yourcompany.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

### Step 5: Wait for DNS Propagation
- DNS changes take 1-24 hours to propagate
- Check status: https://www.whatsmydns.net/
- Your dashboard will be accessible at your custom domain

---

## Option 2: Change GitHub Username

⚠️ **Warning:** This changes ALL your GitHub Pages URLs!

### Steps:

1. Go to https://github.com/settings/admin
2. Click **Change username**
3. Enter new username (e.g., `rackspace-tech`)
4. Confirm the change

### Result:
- Old: `https://roha0680.github.io/Rackspace-Customer-Dashboard/`
- New: `https://rackspace-tech.github.io/Rackspace-Customer-Dashboard/`

### Considerations:
- ❌ Affects ALL your repositories
- ❌ Breaks existing links
- ❌ May affect other projects
- ✅ Free
- ✅ Immediate change

---

## Option 3: GitHub Pro Subdomain

Requires GitHub Pro subscription ($4/month)

### Steps:

1. Upgrade to GitHub Pro
2. Configure custom subdomain in repository settings
3. Use format: `dashboard.roha0680.github.io`

---

## Recommended Approach

### For Professional Use:
**Use Option 1 (Custom Domain)**

**Pros:**
- ✅ Professional appearance
- ✅ Brandable (your company name)
- ✅ Easy to remember
- ✅ Doesn't affect other projects
- ✅ Can move to different hosting later
- ✅ Free SSL certificate from GitHub

**Cons:**
- ❌ Costs $10-15/year
- ❌ Requires DNS configuration
- ❌ 24-hour setup time

**Best domains for your dashboard:**
- `rackspace-dashboard.com`
- `customer-dashboard.rackspace.com` (if you own rackspace.com)
- `dashboard.yourcompany.com`

---

## Quick Setup: Custom Domain

### 1. Buy Domain (5 minutes)
Go to Namecheap or Cloudflare and purchase a domain.

### 2. Configure DNS (5 minutes)

**For subdomain (easiest):**
```
Type: CNAME
Name: dashboard
Value: roha0680.github.io
```

### 3. Update GitHub (2 minutes)
```bash
cd "C:\Users\Rohan Desai\Downloads\Kiro Customer Dashboard"
echo "dashboard.yourcompany.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

Then in GitHub:
- Settings → Pages → Custom domain → Enter your domain → Save

### 4. Wait (1-24 hours)
DNS propagation takes time. Check progress at https://www.whatsmydns.net/

---

## Cost Comparison

| Option | Cost | Time | Professional |
|--------|------|------|--------------|
| Custom Domain | $10-15/year | 24 hours | ⭐⭐⭐⭐⭐ |
| Change Username | Free | Immediate | ⭐⭐ |
| GitHub Pro Subdomain | $48/year | Immediate | ⭐⭐⭐ |
| Keep Current | Free | N/A | ⭐⭐⭐ |

---

## Example Custom Domains

### Good Examples:
- `rackspace-dashboard.com`
- `customer-insights.com`
- `enterprise-dashboard.com`
- `dashboard.yourcompany.com`

### Avoid:
- Long domains (>25 characters)
- Hard to spell domains
- Domains with numbers or hyphens

---

## DNS Configuration Examples

### Namecheap:
1. Login → Domain List → Manage
2. Advanced DNS → Add New Record
3. Add CNAME record as shown above

### Cloudflare:
1. Login → Select Domain → DNS
2. Add Record → CNAME
3. Name: dashboard, Target: roha0680.github.io

### GoDaddy:
1. Login → My Products → DNS
2. Add → CNAME
3. Host: dashboard, Points to: roha0680.github.io

---

## Verification

After setup, verify your domain:

```bash
# Check DNS
nslookup dashboard.yourcompany.com

# Check HTTPS
curl -I https://dashboard.yourcompany.com
```

---

## Need Help?

1. **DNS Issues**: Wait 24 hours, then check https://www.whatsmydns.net/
2. **SSL Certificate**: Takes 24 hours after DNS propagation
3. **404 Error**: Make sure CNAME file is in repository root
4. **Still not working**: Check GitHub Pages settings

---

## My Recommendation

**Buy a custom domain for $10-15/year**

Suggested domain: `rackspace-dashboard.com` or `customer-dashboard.com`

This gives you:
- Professional URL
- Easy to share with team
- Brandable
- Future-proof (can move hosting if needed)

Would you like me to help you set up a custom domain? Let me know which domain you'd like to use!
