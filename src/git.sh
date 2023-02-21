#!/bin/bash

# Get the Git user name and email from environment variables
GIT_NAME="$GIT_USER_NAME"
GIT_EMAIL="$GIT_USER_EMAIL"

# Check if the Git user name and email are set
if [ -z "$GIT_NAME" ] || [ -z "$GIT_EMAIL" ]; then
  echo "Error: Git user name and email environment variables are not set."
  exit 1
fi

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
