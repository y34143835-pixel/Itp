#!/bin/bash

# Configuration
REPO_URL="https://github.com/y34143835-pixel/Itp.git"
ZIP_FILE="com.wangyiheng.vcamsx.zip"
BRANCH="main"

# Initialize git if not already done
if [ ! -d ".git" ]; then
    git init
    git remote add origin $REPO_URL
fi

# Pull latest changes
git pull origin $BRANCH 2>/dev/null || true

# Install Git LFS (if not already installed)
if ! command -v git-lfs &> /dev/null; then
    echo "Installing Git LFS..."
    git lfs install
fi

# Track large files with Git LFS
git lfs track "*.zip"
git add .gitattributes

# Add and push the ZIP file
echo "Adding $ZIP_FILE..."
git add $ZIP_FILE

echo "Committing..."
git commit -m "Add decompiled APK: $ZIP_FILE"

echo "Pushing to GitHub..."
git push -u origin $BRANCH

echo "✓ Upload complete!"
