#!/bin/bash
#
# Download and run the latest release version.
# https://github.com/w3labkr/sh-amp-init
#
# Usage
# git clone https://github.com/w3labkr/sh-amp-init.git
# cd sh-amp-init
# chmod +x ./install.sh
# ./install.sh

# Work even if somebody does "sh thisscript.sh".
set -e

# Print a welcome message.
echo
echo "The upgrade begins."

# Stop the package.
systemctl stop mariadb

# Upgrade the package to the latest.
apt -y install --only-upgrade mariadb-server mariadb-client

# Start the package.
systemctl start mariadb

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "The upgrade is complete."