#!/bin/bash

echo "Finding your local IP address..."
ip=$(ifconfig | grep -Eo '192\.168\.[0-9]+\.[0-9]+') #Filters the output to match only the pattern 192.168.xxx.xxx.
#-E=>Enables extended regex and -o=>Prints only the matching part of each line.

# Check if an IP was found
if [ -n "$ip" ]; then
    echo "Your local IP address is: $ip"
else
    echo "Local IP address in the 192.168.x.x range not found."
fi

<<"COMMENT"
we did not use -I because it is Linux specific and not works on MacOS
SYS_IPS="$(hostname -I)"
IPS_COLLECTION=(${ALL_IPS// / })

# Loop through and find 192.168.x.x
for ip in "${IPS_COLLECTION[@]}"; do
    if [[ $ip == 192.168.* ]]; then
        echo "$ip"
        break
    fi
done

for primary IP we do this: 

ALL_IPS=$(ifconfig | grep -Eo 'inet [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $2}')
IPS_ARRAY=(${ALL_IPS})
echo "Your primary IP address is: ${IPS_ARRAY[0]}"

COMMENT