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

# Upgrade your operating system to the latest.
apt update && apt -y upgrade

# Installing prerequisites
apt -y install git curl wget zip unzip vim

# Removing unused dependencies
apt -y autoremove

# Setting up Timezone
dpkg-reconfigure tzdata

# Print a completion message.
echo
echo "Installation is complete."
