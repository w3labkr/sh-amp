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
echo "Installation begins."

# Start installing the package.
apt -y install mariadb-server mariadb-client

# Enables you to improve the security of your MariaDB installation.
/usr/bin/mysql_secure_installation

# Start the package and set it to start on boot.
systemctl boot mariadb

# Create backup and configuration files.
cp -v /etc/my.cnf{,.bak}

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
