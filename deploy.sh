#!/bin/bash
set -e

REPO_DIR="$HOME/server-administration-lab-deploy"
WEB_DIR="/var/www/html"

cd "$REPO_DIR"

echo "Starting deployment..."

# Safety check: ensure the website file exists
if [ ! -f site/index.html ]; then
    echo "ERROR: site/index.html not found!"
    exit 1
fi

# Basic HTML safety check
if ! grep -qi "<html" site/index.html; then
    echo "ERROR: HTML validation failed!"
    exit 1
fi

echo "Safety checks passed."

# Publish the website
sudo install -m 644 site/index.html "$WEB_DIR/index.html"

echo "Deployment completed at $(date)" | tee -a "$HOME/deploy.log"
