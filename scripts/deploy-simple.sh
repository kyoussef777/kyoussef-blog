#!/bin/bash

# Simple deployment script using wrangler pages publish
# This method works better with existing projects

set -e

echo "🚀 Simple deployment to Cloudflare Pages..."

# Check if dist directory exists
if [ ! -d "dist" ]; then
    echo "📦 Building site first..."
    npm run build
fi

# Deploy using wrangler pages publish (simpler method)
echo "☁️  Deploying to Cloudflare Pages..."
npx wrangler pages publish dist

echo "🎉 Deployment completed!"
echo "🌐 Your site should be available shortly."
echo "📋 Check your Cloudflare Pages dashboard for the deployment URL."