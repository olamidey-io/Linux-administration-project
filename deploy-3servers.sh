#!/bin/bash

# Define the IP addresses for the servers
servers=("192.168.34.11" "192.168.34.12" "192.168.34.13")

# Commands to be run on each server
commands="
  sudo apt update -y && \
  sudo apt upgrade -y && \
  sudo apt install -y nginx apache2
"

# Loop through each server and run the commands
for server in "${servers[@]}"; do
  echo "Connecting to $server from the bastion server..."
  ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no vagrant@$server "$commands"
done

