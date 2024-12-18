#!/bin/bash

#PS1 bash variable ( defines the appearance of command prompt)
CUSTOM_PROMPT=PS1="[\$(date +%T)] \w > "  #HH:MM:SS  , w is current working directory
DOTFILE="$HOME/.dotfile"

echo "Creating or updating $DOTFILE..."
cat > "$DOTFILE" << EOF #output storing
# Custom PS1 prompt
PS1='[\$(date +%T)] \w > '
EOF

BASHRC="$HOME/.bashrc" #assigned path to variable 

if grep -q "source ~/.dotfile" "$BASHRC"; then  #Checks if the line source ~/.dotfile already exists in the .bashrc file
    echo "Dotfile already sourced in $BASHRC."
else
    echo "Adding dotfile sourcing to $BASHRC..."
    echo "if [ -f ~/.dotfile ]; then" >> "$BASHRC"
    echo "    source ~/.dotfile" >> "$BASHRC" #Adds the command to source .dotfile into .bashrc.
    echo "fi" >> "$BASHRC"
fi

echo "Done! Please restart your terminal or run 'source ~/.bashrc' to apply changes."
