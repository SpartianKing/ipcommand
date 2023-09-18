#!/bin/bash

# ANSI escape code for green text
GREEN='\033[0;32m'
# ANSI escape code to reset text color
RESET_COLOR='\033[0m'

# Function to display the public IP
display_public_ip() {
    ip=$(curl -s https://ipinfo.io/ip)
    echo -e "Public IP: ${GREEN}$ip${RESET_COLOR}"
}

# Function to display the exit screen
display_exit_screen() {
    echo "Press Enter to exit..."
    read -p ""
}

# Main loop
while true; do
    clear
    read -p "Do you want to view the public IP? (yes/no): " choice
    case "$choice" in
        [Yy][Ee][Ss]|[Yy])
            display_public_ip
            exit
            ;;
        [Nn][Oo]|[Nn])
            echo "IP not displayed. Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter 'yes' or 'no'."
            ;;
    esac
done
