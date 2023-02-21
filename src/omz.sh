#!/bin/bash

# Check if Oh My Zsh is already installed
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed."
else
  # Install Oh My Zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check if the zsh-syntax-highlighting plugin is already installed
if [ -d "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
  echo "zsh-syntax-highlighting plugin is already installed."
else
  # Clone the zsh-syntax-highlighting plugin to the Oh My Zsh custom plugins directory
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

# Check if the zsh-syntax-highlighting plugin is already in the list of plugins
if grep -q "plugins=(.*zsh-syntax-highlighting)" "$HOME/.zshrc"; then
  echo "zsh-syntax-highlighting plugin is already in the list of plugins."
else
  # Add the zsh-syntax-highlighting plugin to the list of plugins
  sed -i '' 's/^plugins=(/plugins=(zsh-syntax-highlighting /' "$HOME/.zshrc"
fi