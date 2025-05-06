# rmds

A simple utility to remove all .DS_Store files recursively from the current directory.

## Why is this helpful?

`.DS_Store` files are automatically created by macOS Finder to store folder viewing preferences. These files can cause issues in several scenarios:

- When submitting files to systems that break if `.DS_Store` files are included
- In automated workflows where any extra files beyond what's needed can cause failures
- When sharing archives or repositories with non-macOS users
- In version control systems where these files create unnecessary noise

While `.DS_Store` files will be recreated when Finder opens the directory again, having a simple command to quickly remove them before performing sensitive operations is invaluable.

## Installation

### Using Homebrew

```bash
brew tap fitchmultz/tap
brew install rmds
```

or directly:

```bash
brew install fitchmultz/tap/rmds
```

## Development

Project repository: https://github.com/fitchmultz/rmds

## Usage

```bash
rmds           # Remove all .DS_Store files silently
rmds -v        # Show files as they are deleted
rmds --help    # Show help information
```

This will remove all .DS_Store files in the current directory and all subdirectories.

## License

MIT