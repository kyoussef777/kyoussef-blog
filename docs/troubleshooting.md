# Troubleshooting Guide

Common deployment and development issues with solutions.

## Cloudflare Pages Issues

### API Authentication Errors

**Error**: "Authentication error [code: 10000]" when deploying

**Problem**: The API token lacks required permissions for Pages deployment.

**Solution**: Update your API token permissions.

#### Fix API Token Permissions

1. **Go to [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)**

2. **Edit your existing token** or create a new one with these permissions:
   ```
   Account - Cloudflare Pages:Edit
   Zone - Zone Settings:Read  
   Zone - Zone:Read
   User - User Details:Read
   ```

3. **Account Resources**: Include your account
4. **Zone Resources**: Include your domain (kyoussef.com)

#### Alternative: Use Simpler Deployment Method

If API token issues persist, try the simpler deployment method:

```bash
# Use the simple deployment script
npm run deploy:simple

# Or manually
npx wrangler pages publish dist
```

This method will:
- Automatically detect your project
- Use interactive authentication if needed
- Work with existing Cloudflare Pages projects

### Missing pages_build_output_dir Error

**Error**: "missing the 'pages_build_output_dir' field, required by Pages"

**Solution**: The `wrangler.toml` now includes the required field:
```toml
pages_build_output_dir = "dist"
```

### Project Name Mismatch

**Error**: Project not found or wrong project name

**Solution**: Ensure you're using the correct project name:
- Current project name: `kyoussef-blog`
- Update any deployment scripts to use this name

### Build Failures

**Error**: Build command failed or dependencies not found

**Solutions**:
1. **Check Node.js version** in Cloudflare Pages settings:
   - Go to project → Settings → Environment variables
   - Set `NODE_VERSION` to `20`

2. **Verify build settings**:
   ```
   Framework preset: Astro
   Build command: npm run build
   Build output directory: dist
   Root directory: (leave empty)
   ```

3. **Check build logs** in Cloudflare dashboard for specific errors

## Node.js Version Issues

### Error: "Wrangler requires at least Node.js v20.0.0"

**Problem**: Using Node.js 18.x, but Wrangler requires Node.js 20+.

**Solution**: Upgrade to Node.js 20 or higher.

#### Using Node Version Manager (nvm) - Recommended

```bash
# Install Node.js 20
nvm install 20
nvm use 20
nvm alias default 20

# Verify version
node --version  # Should show v20.x.x
```

#### Using Volta

```bash
# Install Node.js 20
volta install node@20

# Verify version
node --version
```

#### After Upgrading Node.js

1. **Clear npm cache and reinstall dependencies**:
   ```bash
   rm -rf node_modules package-lock.json
   npm install
   ```

2. **Test the build**:
   ```bash
   npm run build
   npm run preview
   ```

## GitHub Actions Issues

### Workflow Not Running

**Solutions**:
1. **Check workflow file syntax** using GitHub's validator
2. **Verify repository permissions** for Actions
3. **Check branch protection rules**

### Secret Variables Missing

**Problem**: `CLOUDFLARE_API_TOKEN` or `CLOUDFLARE_ACCOUNT_ID` errors

**Solutions**:
1. **Add secrets to repository**:
   - Go to Settings → Secrets and variables → Actions
   - Add required secrets with correct values

2. **Verify API token has correct permissions** (see API Authentication section above)

## Local Development Issues

### "Module not found" Errors

**Solutions**:
```bash
# Clear and reinstall dependencies
rm -rf node_modules package-lock.json
npm install

# Check for conflicting global packages
npm list -g --depth=0
```

### Build Errors

**Solutions**:
1. **Run type checking**:
   ```bash
   npm run check
   ```

2. **Check for syntax errors** in Astro components
3. **Verify imports and file paths**

## Quick Deployment Methods

### Method 1: Config-Based Deployment (Recommended)

```bash
npm run deploy:config
```
Uses settings from `wrangler.toml` automatically.

### Method 2: Simple Deployment with Project Name

```bash
npm run deploy:simple
```
Explicitly specifies the project name.

### Method 3: Full Deployment Script

```bash
npm run deploy
```
Complete deployment with all checks.

### Method 4: Manual Steps

```bash
npm run build
npx wrangler pages deploy dist --project-name=kyoussef-blog
```

### Method 5: Via Cloudflare Dashboard

1. Build locally: `npm run build`
2. Go to Cloudflare Pages dashboard
3. Upload the `dist` folder manually

## Useful Debugging Commands

```bash
# Check versions
node --version
npm --version
npx wrangler --version

# Verify project dependencies
npm list

# Check for security vulnerabilities
npm audit

# Clear npm cache
npm cache clean --force

# Verbose build output
npm run build -- --verbose

# Test site locally
npm run preview
```

## Getting Help

### Log Files and Debugging

1. **Cloudflare Pages logs**: Available in project dashboard → Functions tab
2. **GitHub Actions logs**: Available in repository → Actions tab
3. **Local development**: Check terminal output and browser developer tools

### Community Resources

- 📖 [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages/)
- 🚀 [Astro Documentation](https://docs.astro.build/)
- 💬 [Cloudflare Community](https://community.cloudflare.com/)
- 🐛 [Astro Discord](https://astro.build/chat)

---

*For additional help, check the [deployment guide](./deployment-guide.md) or the [architecture documentation](./architecture.md).*