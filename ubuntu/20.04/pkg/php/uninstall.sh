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
echo "Uninstallation begins."

# Stop the package.
systemctl stop php

# Remove the package completely.
apt remove php
apt purge php
apt autoremove

# If the directory still exists, delete it.
if [ -d /etc/php ]; then
  rm -rf /etc/php
fi

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Removal is complete."