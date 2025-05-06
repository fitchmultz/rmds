# Maintaining Your Homebrew Tap

This guide helps you maintain and update your Homebrew tap when releasing new versions of rmds.

## Repository Overview

You maintain two repositories:

1. **[fitchmultz/rmds](https://github.com/fitchmultz/rmds)** - Main code repository
2. **[fitchmultz/homebrew-tap](https://github.com/fitchmultz/homebrew-tap)** - Homebrew tap repository

## Complete Update Workflow

### Step 1: Update Your Main Repository

1. Make code changes in the main repository
2. Commit and push changes
3. Create a new release on GitHub:
   - Go to https://github.com/fitchmultz/rmds/releases
   - Click "Draft a new release"
   - Set tag version (e.g., `v1.0.2`)
   - Add release title and description
   - Publish release

### Step 2: Calculate SHA256 of New Release

```bash
# Download the new release tarball
curl -L -o rmds-new.tar.gz https://github.com/fitchmultz/rmds/archive/refs/tags/vX.Y.Z.tar.gz

# Calculate SHA256 hash
shasum -a 256 rmds-new.tar.gz
```

### Step 3: Update the Formula

1. Clone your tap repository (if you don't have it locally):
   ```bash
   git clone https://github.com/fitchmultz/homebrew-tap.git
   cd homebrew-tap
   ```

2. Edit the formula file (`Formula/rmds.rb`):
   - Update the URL to point to the new release
   - Update the SHA256 hash
   - Example changes:

   ```ruby
   # Change from
   url "https://github.com/fitchmultz/rmds/archive/refs/tags/v1.0.1.tar.gz"
   sha256 "e59532a7a1cfecd37fdd1f9698606b111d43eb7ad1aac36bc5a34b154f8f6cdc"
   
   # To
   url "https://github.com/fitchmultz/rmds/archive/refs/tags/v1.0.2.tar.gz"
   sha256 "NEW_SHA256_HASH_HERE"
   ```

3. Commit and push the changes:
   ```bash
   git add Formula/rmds.rb
   git commit -m "Update rmds to v1.0.2"
   git push origin main
   ```

### Step 4: Test the Updated Formula

```bash
# Update your tap
brew update
brew tap fitchmultz/tap

# Uninstall previous version 
brew uninstall rmds

# Install new version
brew install fitchmultz/tap/rmds

# Verify installation
which rmds
$(brew --prefix)/bin/rmds --help
```

## Example: Complete Update Workflow

Let's say you've added a new feature to rmds and want to release v1.0.2:

```bash
# Step 1: Create the release on GitHub
# (Do this through the GitHub web interface)

# Step 2: Calculate SHA256
curl -L -o rmds-1.0.2.tar.gz https://github.com/fitchmultz/rmds/archive/refs/tags/v1.0.2.tar.gz
shasum -a 256 rmds-1.0.2.tar.gz
# Example output: abc123def456...

# Step 3: Update formula
cd /path/to/homebrew-tap
git pull origin main

# Edit Formula/rmds.rb with the new version and SHA256
# Then commit and push
git add Formula/rmds.rb
git commit -m "Update rmds to v1.0.2"
git push origin main

# Step 4: Test
brew update
brew tap fitchmultz/tap
brew uninstall rmds
brew install fitchmultz/tap/rmds
$(brew --prefix)/bin/rmds --help
```

## Troubleshooting

### Formula Not Updating

If users report they can't get the new version:

```bash
# Tell them to run:
brew update
brew upgrade rmds
```

### SHA256 Mismatch

If you get a SHA256 mismatch error:

1. Double-check you downloaded the correct release
2. Make sure you're using the exact release URL in the formula
3. Recalculate the SHA256 and update the formula again

### Audit Your Formula

To ensure your formula is correctly formatted:

```bash
brew audit --strict --online Formula/rmds.rb
```

## Remember

- Always increment the version number for new releases
- Always update the SHA256 hash when the URL changes
- Keep both repositories updated and in sync