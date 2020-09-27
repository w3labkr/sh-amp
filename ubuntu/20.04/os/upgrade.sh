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
echo "The update begins."

# Upgrade operating system to the latest.
apt update && apt -y upgrade

# Removing unused dependencies
apt -y autoremove

# Print a completion message.
echo
echo "The update is complete."
