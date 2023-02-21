#!/bin/bash

xcode-select --install

# open relevant download links
open 'https://code.visualstudio.com/download'
open 'https://www.docker.com/products/docker-desktop/'
open 'https://openzfsonosx.org/wiki/Downloads'
open 'https://folivora.ai'
open 'https://www.macbartender.com'

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# install brew bundle
brew bundle install

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup

# install foundryup
curl -L https://foundry.paradigm.xyz | bash
# install foundry
foundryup

# install bifrost
curl -L https://raw.githubusercontent.com/Jon-Becker/heimdall-rs/main/bifrost/install | bash
# install heimdall
bifrost

# install huffup
curl -L get.huff.sh | bash
huffup


brew install --cask 1password/tap/1password-cli

echo 'run "(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile" to finish setup'

# make ~/dev if it does not exist
mkdir -p ~/dev
