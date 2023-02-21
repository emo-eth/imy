#!/bin/bash

# Set the installation directory
INSTALL_DIR="$HOME/dev/erigon"


# Clone the Erigon repository if it doesn't already exist
if [ -d "$INSTALL_DIR" ]; then
  echo "Erigon is already installed."
else
  git clone https://github.com/ledgerwatch/erigon.git "$INSTALL_DIR"
  echo "Erigon cloned to $INSTALL_DIR."
fi

# Switch to the cloned directory
cd "$INSTALL_DIR"

# Build Erigon if it's not already built
if [ -f "$INSTALL_DIR/build/bin/erigon" ]; then
  echo "Erigon is already built."
else
  make
  echo "Erigon built."
fi

echo "Erigon installed and built."

if [[ ":$PATH:" == *":$INSTALL_DIR/build/bin:"* ]]; then
  echo "Erigon is already in the PATH environment variable."
else
  echo "Adding Erigon to the PATH environment variable."
  echo "export PATH=\"\$PATH:$INSTALL_DIR/build/bin\"" >> "$HOME/.bash_profile"
  source "$HOME/.bash_profile"
fi
