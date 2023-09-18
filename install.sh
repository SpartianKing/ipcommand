#!/bin/bash

# Clone the GitHub repository
git clone https://github.com/SpartianKing/ipcommand

# Change directory to the cloned repository
cd ipcommand

# Create the directory structure under /usr/commands/ip/
sudo mkdir -p /usr/commands/ip

# Move the ip.sh script to the installation directory
sudo mv ip.sh /usr/commands/ip/

# Change permissions for the script
sudo chmod +x /usr/commands/ip/ip.sh

# Create a symbolic link in /usr/local/bin for easy access
sudo ln -s /usr/commands/ip/ip.sh /usr/local/bin/ip

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# ANSI escape code for green text
GREEN='\033[0;32m'
# ANSI escape code to reset text color
RESET_COLOR='\033[0m'

# Print installation message in green
echo -e "${GREEN}Ip has been installed! Please run the command 'ip' in the terminal to get your public IP!${RESET_COLOR}"
