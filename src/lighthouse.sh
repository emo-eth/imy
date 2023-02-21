#!/bin/bash

# Set the installation directory
INSTALL_DIR="$HOME/dev/lighthouse"

# Set the Lighthouse branch to clone and build
LIGHTHOUSE_BRANCH="master"

# Clone the Lighthouse repository if it doesn't already exist
if [ -d "$INSTALL_DIR" ]; then
  echo "Lighthouse is already installed."
else
  git clone -b "$LIGHTHOUSE_BRANCH" https://github.com/sigp/lighthouse.git "$INSTALL_DIR"
  echo "Lighthouse cloned to $INSTALL_DIR."
fi

# Switch to the cloned directory
cd "$INSTALL_DIR"

# Install the Rust compiler and toolchain if it's not already installed
if ! command -v rustup &> /dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"
  rustup default stable
  echo "Rust installed."
else
  echo "Rust is already installed."
fi

# Build Lighthouse if it's not already built
if [ -f "$INSTALL_DIR/target/release/lighthouse" ]; then
  echo "Lighthouse is already built."
else
  cargo build --release
  echo "Lighthouse built."
fi

# Add Lighthouse to the PATH environment variable
if [[ ":$PATH:" == *":$INSTALL_DIR/target/release:"* ]]; then
  echo "Lighthouse is already in the PATH environment variable."
else
  echo "Adding Lighthouse to the PATH environment variable."
  echo "export PATH=\"\$PATH:$INSTALL_DIR/target/release\"" >> "$HOME/.bash_profile"
  source "$HOME/.bash_profile"
fi

echo "Lighthouse installed, built, and added to the PATH environment variable."
