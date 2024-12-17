#!/bin/bash

input="$*"
length=${#input}

# Print the top border
for ((i = 0; i < length; i++)); do
    echo -n "*"
done
echo "****"

# Print the string with side borders
echo "* $input *"

# Print the bottom border
for ((i = 0; i < length; i++)); do
    echo -n "*"
done
echo "****"
