#!/bin/bash

# Deployment using wrangler.toml configuration
# This should automatically use the settings from wrangler.toml

set -e

echo "🚀 Deploying using wrangler.toml configuration..."

# Check if dist directory exists
if [ ! -d "dist" ]; then
    echo "📦 Building site first..."
    npm run build
fi

# Deploy using wrangler.toml configuration
echo "☁️  Deploying to Cloudflare Pages..."
echo "📋 Using configuration from wrangler.toml"
npx wrangler pages deploy

echo "🎉 Deployment completed!"
echo "🌐 Your site should be available at: https://kyoussef.com"
echo "📋 Check your Cloudflare Pages dashboard for details."