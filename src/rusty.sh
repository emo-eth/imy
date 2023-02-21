#!/bin/bash

# Install Rust
if [ -x "$(command -v rustup)" ]; then
    echo "Rustup is already installed."
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
    echo "Rustup installed."
    # Run Rust
    echo "Running Rustup..."
    rustup
fi


# Install FoundryUp
if [ -x "$(command -v foundryup)" ]; then
    echo "FoundryUp is already installed."
else
    curl -L https://foundry.paradigm.xyz | bash
    echo "FoundryUp installed."
    # Run FoundryUp
    echo "Running FoundryUp..."
    foundryup
fi



# Install Bifrost
if [ -x "$(command -v bifrost)" ]; then
    echo "Bifrost is already installed."
else
    curl -L https://raw.githubusercontent.com/Jon-Becker/heimdall-rs/main/bifrost/install | bash
    echo "Bifrost installed."
    # Run Bifrost
    echo "Running Bifrost..."
    bifrost
fi



# Install HuffUp
if [ -x "$(command -v huffup)" ]; then
    echo "HuffUp is already installed."
else
    curl -L get.huff.sh | bash
    echo "HuffUp installed."
    # Run HuffUp
    echo "Running HuffUp..."
    huffup
fi

