# Tasks for Submitting rmds to Homebrew Core

## 1. Repository Setup
- [ ] Initialize git repository: `git init`
- [ ] Create GitHub repository: https://github.com/mitchfultz/rmds
- [ ] Add all files to git
- [ ] Make initial commit
- [ ] Push to GitHub
- [ ] Create a v1.0.0 release on GitHub

## 2. Improve Implementation
- [ ] Update rmds script to add --help flag
- [ ] Add output message showing files deleted
- [ ] Create a simple man page

## 3. Formula Testing
- [ ] Install Homebrew tap tools: `HOMEBREW_NO_INSTALL_FROM_API=1 brew tap --force homebrew/core`
- [ ] Download tarball from GitHub release
- [ ] Calculate SHA256: `shasum -a 256 v1.0.0.tar.gz`
- [ ] Update formula with actual SHA256
- [ ] Test formula locally: `brew install --build-from-source ./rmds.rb`
- [ ] Run audit: `brew audit --strict --new-formula rmds`
- [ ] Test installation: `brew test rmds`

## 4. Submission Process
- [ ] Fork Homebrew/homebrew-core on GitHub
- [ ] Clone your fork: `git clone https://github.com/[username]/homebrew-core.git`
- [ ] Create a branch: `git checkout -b rmds-formula`
- [ ] Copy formula to Formula/r/rmds.rb
- [ ] Commit: `git commit -m "rmds 1.0.0 (new formula)"`
- [ ] Push to your fork
- [ ] Create pull request to Homebrew/homebrew-core
- [ ] Address any feedback from maintainers

## 5. Post-Acceptance
- [ ] Celebrate when merged!
- [ ] Update README with standard installation instructions
- [ ] Share with the community