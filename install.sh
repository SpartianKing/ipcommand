#!/bin/bash

# Define the IPCommand GitHub repository URL
IPCOMMAND_REPO="https://github.com/SpartianKing/ipcommand"

# Define the installation directory
INSTALL_DIR="/usr/commands/ip"
TMP_DIR="/usr/src/ipcommand"

#Function to install this

sudo tee /etc/apt/apt.conf.d/99-ipcommand-update-install <<EOF
DPkg::Pre-Invoke {"if [ -x /usr/local/bin/ipcommand-update-install.sh ]; then /usr/local/bin/ipcommand-update-install.sh \$1; fi";};
EOF
# Function to install or update IPCommand
install_or_update_ipcommand() {
    if [[ -d "$TMP_DIR" ]]; then
        cd "$TMP_DIR"
        git pull
    else
        git clone "$IPCOMMAND_REPO" "$TMP_DIR"
    fi

    if [[ -f "$TMP_DIR/ip.sh" ]]; then
        sudo mv "$TMP_DIR/ip.sh" "$INSTALL_DIR/ip.sh"
        sudo chmod +x "$INSTALL_DIR/ip.sh"
    fi
}

# Check for command-line arguments
if [[ $# -eq 0 ]]; then
    # If no arguments provided, install or update IPCommand
    install_or_update_ipcommand
elif [[ "$1" == "install" ]]; then
    # If "install" argument provided, perform installation
    install_or_update_ipcommand
fi

# Call the original apt-get command with the provided arguments
exec /usr/bin/apt-get "$@"
