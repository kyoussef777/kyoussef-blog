# Deployment Guide - Cloudflare Pages

This guide provides step-by-step instructions for deploying the portfolio to Cloudflare Pages.

## Prerequisites

- ✅ GitHub account with repository access
- ✅ Cloudflare account (free tier available)
- ✅ Domain name registered (kyoussef.com)
- ✅ Node.js 20+ installed locally

## Step 1: Repository Setup

### 1.1 Clone and Prepare Repository

```bash
# Clone the repository
git clone https://github.com/kyoussef777/kamal-youssef-portfolio.git
cd kamal-youssef-portfolio

# Install dependencies
npm install

# Test build locally
npm run build
npm run preview
```

### 1.2 Verify Configuration Files

Ensure these files are present in your repository:
- `wrangler.toml` - Cloudflare configuration
- `_headers` - Security and caching headers
- `_redirects` - URL redirects and rules
- `.github/workflows/` - CI/CD workflows

## Step 2: Cloudflare Pages Setup

### 2.1 Create Cloudflare Pages Project

1. **Login to Cloudflare**:
   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - Navigate to "Pages" in the sidebar

2. **Create New Project**:
   - Click "Create a project"
   - Choose "Connect to Git"
   - Authorize GitHub integration

3. **Select Repository**:
   - Choose your portfolio repository
   - Click "Begin setup"

### 2.2 Configure Build Settings

```yaml
Production branch: main
Framework preset: Astro
Build command: npm run build
Build output directory: dist
Root directory: (leave empty)
```

### 2.3 Environment Variables

Add these environment variables:

| Variable | Value | Description |
|----------|-------|-------------|
| `NODE_VERSION` | `20` | Node.js version for builds |
| `NPM_CONFIG_PRODUCTION` | `false` | Include dev dependencies in build |

### 2.4 Deploy

Click "Save and Deploy" - first deployment will take 2-3 minutes.

## Step 3: Custom Domain Setup

### 3.1 Add Custom Domain

1. In your Cloudflare Pages project:
   - Go to "Custom domains" tab
   - Click "Set up a custom domain"
   - Enter: `kyoussef.com`

2. Configure DNS records:
   ```
   Type: CNAME
   Name: @
   Target: kamal-youssef-portfolio.pages.dev
   ```

### 3.2 SSL Certificate

Cloudflare automatically provisions SSL certificates for custom domains.
- **Initial setup**: 5-15 minutes
- **Auto-renewal**: Managed by Cloudflare

## Step 4: GitHub Actions Setup (Optional)

### 4.1 Create Cloudflare API Token

1. Go to [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
2. Click "Create Token"
3. Use "Custom token" template:
   ```
   Permissions:
   - Zone:Zone Settings:Read
   - Zone:Zone:Read  
   - Account:Cloudflare Pages:Edit
   ```

### 4.2 Add GitHub Secrets

In your GitHub repository settings:

1. Go to "Settings" → "Secrets and variables" → "Actions"
2. Add repository secrets:
   - `CLOUDFLARE_API_TOKEN`: Your API token
   - `CLOUDFLARE_ACCOUNT_ID`: Found in Cloudflare dashboard

### 4.3 Verify Workflows

GitHub Actions workflows will now:
- Build and deploy on every push to `main`
- Create preview deployments for pull requests
- Run Lighthouse performance audits

## Step 5: Performance Optimization

### 5.1 Cloudflare Settings

Recommended Cloudflare dashboard settings:

**Speed → Optimization**:
- Auto Minify: ✅ CSS, HTML, JavaScript
- Brotli Compression: ✅ Enabled
- Early Hints: ✅ Enabled

**Security → Edge Certificates**:
- Always Use HTTPS: ✅ Enabled
- HTTP Strict Transport Security: ✅ Enabled

### 5.2 Cache Configuration

The `_headers` file configures caching:
- Static assets: 1 year cache
- HTML files: 5 minutes cache
- Images: 6 months cache

## Step 6: Monitoring Setup

### 6.1 Cloudflare Analytics

Available metrics:
- 📊 Page views and unique visitors
- ⚡ Performance metrics (Core Web Vitals)
- 🌍 Geographic traffic distribution
- 🔒 Security events and blocks

### 6.2 Lighthouse CI

Automatic performance monitoring:
- Runs on every pull request
- Comments results on PRs
- Tracks performance regressions

### 6.3 Uptime Monitoring

Consider setting up external monitoring:
- [UptimeRobot](https://uptimerobot.com/) (free)
- [Pingdom](https://www.pingdom.com/)
- Cloudflare Health Checks (paid)

## Step 7: Post-Deployment Checklist

### 7.1 Functionality Tests

Test all major features:
- [ ] Homepage loads correctly
- [ ] Navigation works on all pages
- [ ] About page displays properly
- [ ] Projects links work
- [ ] Blog posts are accessible
- [ ] Social media links work
- [ ] Mobile responsiveness

### 7.2 Performance Verification

Run these tests:
- [ ] [PageSpeed Insights](https://pagespeed.web.dev/)
- [ ] [GTmetrix](https://gtmetrix.com/)
- [ ] [WebPageTest](https://www.webpagetest.org/)

Target scores:
- Performance: 95+
- Accessibility: 95+
- Best Practices: 95+
- SEO: 95+

### 7.3 SEO Setup

Verify SEO elements:
- [ ] Sitemap accessible at `/sitemap-index.xml`
- [ ] RSS feed at `/rss.xml`
- [ ] Proper meta descriptions
- [ ] Open Graph tags
- [ ] Structured data markup

## Troubleshooting

### Common Build Issues

**Build fails with "Module not found"**:
```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

**Deployment timeout**:
- Check build command in Pages settings
- Verify `package.json` scripts
- Review build logs in Cloudflare dashboard

**Custom domain not working**:
- Verify DNS records
- Check SSL certificate status
- Wait 5-15 minutes for propagation

### Performance Issues

**Slow loading times**:
- Optimize images (use WebP format)
- Enable Cloudflare caching
- Check Lighthouse recommendations

**High bandwidth usage**:
- Implement proper caching headers
- Optimize asset sizes
- Consider image compression

## Security Considerations

### 7.1 Security Headers

The `_headers` file includes:
- `X-Frame-Options: DENY`
- `X-Content-Type-Options: nosniff`
- `Strict-Transport-Security`
- `Referrer-Policy`

### 7.2 Content Security Policy

Consider adding CSP headers for enhanced security:
```
Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:;
```

### 7.3 Regular Updates

- Keep dependencies updated
- Monitor security advisories
- Review Cloudflare security logs

---

## Support

For deployment issues:
- 📖 [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages/)
- 🚀 [Astro Deployment Guide](https://docs.astro.build/en/guides/deploy/cloudflare/)
- 💬 [Cloudflare Community](https://community.cloudflare.com/)

---

*Last updated: August 2025*