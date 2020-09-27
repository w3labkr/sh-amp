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
systemctl stop apache2
systemctl stop apache-htcacheclean

# Remove the package completely.
apt remove apache2
apt purge apache2
apt autoremove

# If the directory still exists, delete it.
if [ -d /etc/apache2 ]; then
  rm -rf /etc/apache2
fi

# Print a completion message.
echo
echo "Removal is complete."
