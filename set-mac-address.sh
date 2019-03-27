#!/bin/bash
# file: set-mac-address.sh

# Print current MAC address
MAC_ADDRESS=$(ifconfig en0 | grep ether | xargs)
MAC_ADDRESS=${MAC_ADDRESS#"ether"}
echo "Permanent MAC Address: ${MAC_ADDRESS}"

# Generate new MAC address if not given
NEW_MAC_ADDRESS=$1
if [ -z "${NEW_MAC_ADDRESS}" ]; then
	NEW_MAC_ADDRESS=$(openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/.$//")
	echo "New MAC Address: ${NEW_MAC_ADDRESS}"
fi

read -p "Confirm? (y/n):" confirm
sudo ifconfig en0 ether ${NEW_MAC_ADDRESS}
MAC_ADDRESS=$(ifconfig en0 | grep ether | xargs)
MAC_ADDRESS=${MAC_ADDRESS#"ether"}
if [ MAC_ADDRESS == NEW_MAC_ADDRESS ]; then
	echo "Set MAC Address: ${NEW_MAC_ADDRESS}"
else
	echo "Changing MAC failed"
fi