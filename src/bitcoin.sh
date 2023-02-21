#!/bin/bash

# Set the installation directory
INSTALL_DIR="$HOME/dev/bitcoin"

# Clone the Bitcoin Core repository if it doesn't already exist
if [ -d "$INSTALL_DIR" ]; then
  echo "Bitcoin Core is already installed."
else
  git clone https://github.com/bitcoin/bitcoin.git "$INSTALL_DIR"
  echo "Bitcoin Core cloned to $INSTALL_DIR."
fi

# Switch to the cloned directory
cd "$INSTALL_DIR"

# Check out the latest release if it's not already checked out
LATEST_RELEASE=$(git describe --tags --abbrev=0)
if git rev-parse --verify "$LATEST_RELEASE" &> /dev/null; then
  echo "Bitcoin Core is already up-to-date with the latest release."
else
  git checkout "$LATEST_RELEASE"
  echo "Checked out latest release of Bitcoin Core: $LATEST_RELEASE."
fi

cd "$INSTALL_DIR"

if [ -f "$INSTALL_DIR/src/bitcoind" ]; then
  echo "Bitcoin Core is already built."
else
  ./autogen.sh
  ./configure
  make
  echo "Bitcoin Core built."
fi

if [[ ":$PATH:" == *":$INSTALL_DIR/src:"* ]]; then
  echo "Bitcoin Core is already in the PATH environment variable."
else
  echo "Adding Bitcoin Core to the PATH environment variable."
  echo "export PATH=\"\$PATH:$INSTALL_DIR/src\"" >> "$HOME/.zshrc"
  source "$HOME/.zshrc"
fi

echo "Bitcoin Core installed, built, and added to the PATH environment variable."
