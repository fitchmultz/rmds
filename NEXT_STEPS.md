# Next Steps for Homebrew Core Submission

## 1. Create GitHub Repository
1. Go to GitHub.com and create a new repository named "rmds"
2. Set it as public
3. Don't initialize with README, LICENSE, or .gitignore (we already have these)

## 2. Push to GitHub
```bash
# Add the GitHub remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/mitchfultz/rmds.git

# Push to GitHub
git push -u origin main
```

## 3. Create a Release
1. Go to your repository on GitHub
2. Click on "Releases" in the right sidebar
3. Click "Create a new release"
4. Use "v1.0.0" as the tag version
5. Title it "rmds 1.0.0"
6. Add release notes (copy from README's "Why is this helpful?" section)
7. Check "This is a pre-release" only if you want feedback before official submission
8. Click "Publish release"

## 4. Get SHA256 for Formula
```bash
# Download the tarball
curl -L -o rmds-1.0.0.tar.gz https://github.com/mitchfultz/rmds/archive/refs/tags/v1.0.0.tar.gz

# Calculate SHA256
shasum -a 256 rmds-1.0.0.tar.gz
```

## 5. Update Formula with SHA256
Edit `rmds.rb` and replace "REPLACE_WITH_ACTUAL_SHA256_AFTER_RELEASE" with the calculated SHA256

## 6. Test Formula Locally
```bash
# Install Homebrew tap tools
HOMEBREW_NO_INSTALL_FROM_API=1 brew tap --force homebrew/core

# Test installation from your local formula
brew install --build-from-source ./rmds.rb

# Run audit
brew audit --strict --new-formula rmds

# Test the installed formula
brew test rmds
```

## 7. Submit to Homebrew Core
```bash
# Fork Homebrew/homebrew-core on GitHub
# Clone your fork (replace YOUR_USERNAME)
git clone https://github.com/YOUR_USERNAME/homebrew-core.git
cd homebrew-core

# Create a branch
git checkout -b rmds-formula

# Copy your formula to the correct location
mkdir -p Formula/r
cp /Users/mitchfultz/Projects/rmds/rmds.rb Formula/r/

# Commit
git add Formula/r/rmds.rb
git commit -m "rmds 1.0.0 (new formula)"

# Push to your fork
git push -u origin rmds-formula
```

8. Create a pull request to Homebrew/homebrew-core through the GitHub interface