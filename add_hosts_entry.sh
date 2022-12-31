#!/bin/bash

# Set the IP address and domain name
IP_ADDRESS=127.0.0.1
DOMAIN_NAME=tools.devops-openweb.com

# Check if the entry already exists in the hosts file
EXISTS=$(grep "$IP_ADDRESS $DOMAIN_NAME" /etc/hosts)

# If the entry does not exist, add it
if [ -z "$EXISTS" ]; then
  echo "Adding $DOMAIN_NAME to /etc/hosts file..."
  echo "$IP_ADDRESS $DOMAIN_NAME" | sudo tee -a /etc/hosts > /dev/null
fi

echo "Done!"