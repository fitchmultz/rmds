# Testing the Formula Locally Before Submission

You can test your formula locally without creating a GitHub repository yet by setting up a local tap:

```bash
# Create a local tap
brew tap-new fitchmultz/local

# Copy your formula to the tap
cp /Users/mitchfultz/Projects/rmds/rmds.rb $(brew --repository fitchmultz/local)/Formula/

# Create a temporary tarball
cd /Users/mitchfultz/Projects/rmds
mkdir -p /tmp/rmds-1.0.0
cp -R * /tmp/rmds-1.0.0
cd /tmp
tar -czf rmds-1.0.0.tar.gz rmds-1.0.0

# Calculate SHA256
shasum -a 256 rmds-1.0.0.tar.gz

# Update formula with the calculated SHA256
# Edit $(brew --repository fitchmultz/local)/Formula/rmds.rb
# Replace REPLACE_WITH_ACTUAL_SHA256_AFTER_RELEASE with the SHA256 value

# Install from your local tap
brew install --verbose fitchmultz/local/rmds

# Test the formula
brew test fitchmultz/local/rmds

# Audit the formula
brew audit --strict --new-formula fitchmultz/local/rmds
```

This allows you to test everything locally before creating the GitHub repository and submitting to Homebrew core.