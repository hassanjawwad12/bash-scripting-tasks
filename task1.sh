#!/bin/bash

# First we check if the 2 arguments are provided as mentioned in the question
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <search_file> <from_folder>"
    exit 1
fi

# Assign arguments to variables
search_file="$1"
from_folder="$2"

# Check if the folder exists
if [ ! -d "$from_folder" ]; then
    echo "Error: Folder '$from_folder' does not exist."
    exit 1
fi

<<"COMMENT"
This loop works recursively and it mimics the DFS, 
ensuring the script explores as deep as possible in each branch before backtracking.
COMMENT

depth_first_search() {
    local folder="$1"

    # Iterate through all items in the folder
    for item in "$folder"/*; do
        if [ -f "$item" ]; then
            # If it's a file (-f), check if it matches the search file
            #The basename command extracts the filename from a full file path, removing any directory components.
            if [ "$(basename "$item")" == "$search_file" ]; then
                echo "Found: $item"
            fi
        elif [ -d "$item" ]; then
            # If it's a directory (-d), recurse into it
            depth_first_search "$item"
        fi
    done
}

# Start the search
depth_first_search "$from_folder"
