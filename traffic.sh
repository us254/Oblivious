#!/bin/bash

echo "User\tUplink\tDownlink"

# Get a list of all users
users=$(cut -d: -f1 /etc/passwd)

# Iterate through each user
for user in $users; do
  # Check if the user has a home directory
  if [ -d "/home/$user" ]; then
    # Retrieve the uplink and downlink traffic for the user
    uplink=$(sudo -u $user vnstat --json | jq '.interfaces[0].traffic.tx' | awk '{sum+=$1} END {print sum/1024/1024}')
    downlink=$(sudo -u $user vnstat --json | jq '.interfaces[0].traffic.rx' | awk '{sum+=$1} END {print sum/1024/1024}')
    echo "$user\t$uplink\t$downlink"
  fi
done
