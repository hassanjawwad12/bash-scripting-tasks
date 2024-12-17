#!/bin/bash

# Dot file path
DOTFILE_PATH="$(pwd)/.dotfile"

# Check if the dotfile exists in the current folder
if [ -e "$DOTFILE_PATH" ]; then
    echo "File found"

    # If the file is empty
    if [ ! -s "$DOTFILE_PATH" ]; then
        # Write to it
        echo "PS1='[\\t] \\w > '" >> ~/.dotfile

        # Append the contents of ~/.dotfile to ~/.bashrc
        cat ~/.dotfile >> ~/.bashrc
    fi

    # Source ~/.bashrc to apply changes
    source ~/.bashrc

    echo "Restart your terminal to see the changes"
    exit 0
fi

# If file not found, create it and write to it
echo "File not found. Creating the file and writing to it."

# Creating the dotfile
touch ~/.dotfile

# Writing PS1 to it
echo "PS1='[\\t] \\w > '" >> ~/.dotfile

# Append the contents of ~/.dotfile to ~/.bashrc
cat ~/.dotfile >> ~/.bashrc

# Source ~/.bashrc to apply changes
source ~/.bashrc

echo "Restart your terminal to see the changes"