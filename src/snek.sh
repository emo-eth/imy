#!/bin/bash

# Set the name of the virtual environment
VENV_NAME="emo"

# Install Python 3 if it's not already installed
if [ -z "$(pyenv versions | grep 3)" ]; then
    pyenv install 3
    echo "Python 3 installed."
else
    echo "Python 3 is already installed."
fi

# Create a new virtual environment with the specified name if it doesn't already exist
if [ -d "$(pyenv root)/versions/$VENV_NAME" ]; then
    echo "Virtual environment $VENV_NAME already exists."
else
    pyenv virtualenv 3 "$VENV_NAME"
    echo "Virtual environment $VENV_NAME created."
fi

# Activate the virtual environment and set it as the global environment
pyenv global "$VENV_NAME"
echo "Virtual environment $VENV_NAME activated and set as the global environment."

pip install wheel
# Install the data science dependency stack
pip install jupyter pandas numpy scikit-learn

# Install psycopg2 if it's not already installed
if python -c "import psycopg2" &> /dev/null; then
    echo "psycopg2 is already installed."
else
    # Install the psycopg2 dependencies
    brew install libpq
    # Install psycopg2
    pip install psycopg2
    echo "psycopg2 installed."
fi

# Install EVM stack libraries
pip install web3 ens

echo "Data science and EVM stack libraries installed."
