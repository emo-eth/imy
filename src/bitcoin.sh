#!/bin/bash

# Set the installation directory
INSTALL_DIR="$HOME/dev/bitcoin-core"

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

# Configure and build Bitcoin Core
./autogen.sh
./configure
make

echo "Bitcoin Core installed and built."
