#!/bin/bash

box_char=""
string=""

# Parse flags and arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -s)
            string="$2"
            shift 2
            ;;
        -c)
            box_char="$2"
            shift 2
            ;;
        *)
            echo "Usage: $0 -s \"string\" [-c \"character\"]"
            exit 1
            ;;
    esac
done

# Default box character if -c is not provided
if [[ -z "$box_char" ]]; then
    box_char=""
fi

# If no string is provided, exit with an error
if [[ -z "$string" ]]; then
    echo "Error: String (-s) is required."
    echo "Usage: $0 -s \"string\" [-c \"character\"]"
    exit 1
fi

length=${#string}

# Print the top border
if [[ -n "$box_char" ]]; then
    for ((i = 0; i < length + 4; i++)); do
        echo -n "$box_char"
    done
    echo
fi

# Print the string with borders
if [[ -n "$box_char" ]]; then
    echo "$box_char $string $box_char"
else
    echo "$string"
fi

# Print the bottom border
if [[ -n "$box_char" ]]; then
    for ((i = 0; i < length + 4; i++)); do
        echo -n "$box_char"
    done
    echo
fi
