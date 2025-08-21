#!/bin/bash

# Deployment script for Cloudflare Pages
# Usage: ./scripts/deploy.sh

set -e  # Exit on any error

echo "🚀 Starting deployment to Cloudflare Pages..."

# Check Node.js version
NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo "❌ Error: Node.js 20 or higher is required. Current version: $(node --version)"
    echo "💡 Consider using a Node.js version manager:"
    echo "   - nvm: https://github.com/nvm-sh/nvm"
    echo "   - volta: https://volta.sh/"
    exit 1
fi

echo "✅ Node.js version check passed: $(node --version)"

# Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Run type checking
echo "🔍 Running type checks..."
npm run astro check

# Build the site
echo "🏗️  Building site..."
npm run build

# Deploy using Wrangler
echo "☁️  Deploying to Cloudflare Pages..."
npx wrangler pages deploy dist --project-name=kamal-youssef-portfolio

echo "🎉 Deployment completed successfully!"
echo "🌐 Your site will be available at: https://kyoussef.com"