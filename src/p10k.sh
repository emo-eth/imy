#!/bin/bash

# Check if Powerlevel10k is already installed
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  echo "Powerlevel10k is already installed."
else
  # Install Powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# Install the Meslo Nerd Fonts if they're not already installed
FONT_DIR="$HOME/Library/Fonts"

if [ -f "$FONT_DIR/Meslo LG M Regular Nerd Font Complete.otf" ]; then
  echo "Meslo Nerd Fonts are already installed."
else
  # Download and install the Meslo Nerd Fonts
  git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh Meslo
  cd ..
  rm -rf nerd-fonts
  echo "Meslo Nerd Fonts installed."
fi

# Set the font for the terminal emulator to MesloLGS NF

# Set the Powerlevel10k theme in the ~/.zshrc file
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"

# Reload the ~/.zshrc file to activate the changes
source "$HOME/.zshrc"