#!/bin/bash

# Set the Git user name and email
GIT_NAME="James Wenzel"
GIT_EMAIL="wenzel.james.r@gmail.com"

# Set the Git editor
GIT_EDITOR="nano"

# Configure Git if the configuration file does not already exist
if [ -f "$HOME/.gitconfig" ]; then
  echo "Git is already configured."
else
  # Set the Git user name and email
  git config --global user.name "$GIT_NAME"
  git config --global user.email "$GIT_EMAIL"

  # Set the Git editor
  git config --global core.editor "$GIT_EDITOR"

  echo "Git configured."
fi
