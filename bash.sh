#!/bin/bash

readonly DIR="/etc/sysconfig/network-scripts"
readonly IP=$(ip a)

echo "Current network settings:"
echo "$IP" | awk '/^[0-9]/{iface=$2} /inet / {printf "Interface: %s, IP Address: %s\n", iface, $2}'

read -p "Enter the interface to modify: " IFACE
read -p "Enter the new IP address: " NEW_IP_ADDRESS

confirm=$(echo -e "Are you sure you want to modify the IP address on interface $IFACE to $NEW_IP_ADDRESS? (y/n): ")

while [[ $confirm != [yY] ]]; do
    read -p "Please confirm: " confirm
done

cp "$DIR"/ifcfg-$IFACE "$DIR"/ifcfg-$IFACE.bak

if ! grep -q "^DEVICE=$IFACE" "$DIR"/ifcfg-$IFACE; then
    echo -e "DEVICE=$IFACE\nIPADDR=$NEW_IP_ADDRESS\nNETMASK=255.255.255.0" >> "$DIR"/ifcfg-$IFACE
else
    sed -i "/^IPADDR=.*/c\IPADDR=$NEW_IP_ADDRESS" "$DIR"/ifcfg-$IFACE
fi

echo "IP address successfully changed to $NEW_IP_ADDRESS"

nmcli con reload $IFACE

