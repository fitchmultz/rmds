# Usage Examples for rmds

Here are some practical examples of how to use rmds in different workflows:

## 1. Before Creating ZIP Archives

```bash
# Clean up .DS_Store files before creating a zip
rmds
zip -r project.zip .
```

## 2. In Git Pre-Commit Hooks

Add this to your `.git/hooks/pre-commit` file to automatically remove .DS_Store files before committing:

```bash
#!/bin/bash
# Pre-commit hook to remove .DS_Store files

# Run rmds in the repository root
rmds

# Re-add all changes (including the removed .DS_Store files)
git add -u
```

Make the hook executable: `chmod +x .git/hooks/pre-commit`

## 3. In Build Scripts

```bash
#!/bin/bash
# Example build script for a web project

# Clean the project
echo "Cleaning project..."
rm -rf dist
mkdir dist

# Remove .DS_Store files
echo "Removing .DS_Store files..."
rmds

# Build the project
echo "Building project..."
npm run build

# Copy files to dist
echo "Copying files to dist..."
cp -R build/* dist/
```

## 4. In Continuous Integration Workflows

Example GitHub Actions workflow:

```yaml
name: Build and Deploy

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '16'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Remove .DS_Store files
      run: |
        brew install rmds
        rmds
    
    - name: Build
      run: npm run build
    
    - name: Deploy
      uses: JamesIves/github-pages-deploy-action@4.1.4
      with:
        branch: gh-pages
        folder: build
```

## 5. As Part of a Backup Script

```bash
#!/bin/bash
# Backup script for important files

# Set backup location
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

# Go to the directory to backup
cd "$HOME/Documents/important-project"

# Remove .DS_Store files
rmds

# Create dated backup
BACKUP_FILE="$BACKUP_DIR/important-project-$(date +%Y%m%d).tar.gz"
tar -czf "$BACKUP_FILE" .

echo "Backup created at $BACKUP_FILE"
```