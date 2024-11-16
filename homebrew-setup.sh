#!/bin/bash

# Print script usage
echo "============================================"
echo "🌟 Welcome, Martin! 🌟"
echo "Let's get your Mac set up with all your favorite tools and apps."
echo "Sit back, relax, and let this script handle the heavy lifting. 🚀"
echo "============================================"

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Update and upgrade Homebrew
echo "Updating and upgrading Homebrew..."
brew update && brew upgrade

# List of packages to install
PACKAGES=(
  git
  node
  python3
  wget
  dotnet-sdk
  terraform
  tfenv
  azure-cli
  tree
  gh
)

# List of applications to install via cask
CASKS=(
  visual-studio-code
  firefox
  arc
  steam
  warps
  chatgpt
  powershell
  raycast
  rider
  microsoft-azure-storage-explorer
  azure-data-studio
  slack
  notion
  notion-calendar
  docker
)

# Install packages
echo "Installing packages..."
for package in "${PACKAGES[@]}"; do
  if ! brew list "$package" &>/dev/null; then
    echo "Installing $package..."
    brew install "$package"
  else
    echo "$package is already installed."
  fi
done

# Install cask applications
echo "Installing applications..."
for cask in "${CASKS[@]}"; do
  if ! brew list --cask "$cask" &>/dev/null; then
    echo "Installing $cask..."
    brew install --cask "$cask"
  else
    echo "$cask is already installed."
  fi
done

# Verify .NET installation
echo "Verifying .NET installation..."
if ! command -v dotnet &>/dev/null; then
  echo "dotnet was not installed successfully. Please check your Homebrew setup."
else
  echo "dotnet installed successfully!"
  dotnet --version
fi

# Cleanup
echo "Cleaning up..."
brew cleanup

echo "Setup script completed!"