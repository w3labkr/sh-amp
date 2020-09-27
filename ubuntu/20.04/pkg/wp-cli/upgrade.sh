#!/bin/bash
#
# Download and run the latest release version.
# https://github.com/w3labkr/amp-init
#
# Usage
# git clone https://github.com/w3labkr/amp-init.git
# cd amp-init
# chmod +x ./install.sh
# ./install.sh

# Work even if somebody does "sh thisscript.sh".
set -e

# Print a welcome message.
echo
echo "The upgrade begins."
echo
echo '---------------------------------------------------'
echo '  __          _______         _____ _      _____   '
echo '  \ \        / /  __ \       / ____| |    |_   _|  '
echo '   \ \  /\  / /| |__) |_____| |    | |      | |    '
echo '    \ \/  \/ / |  ___/______| |    | |      | |    '
echo '     \  /\  /  | |          | |____| |____ _| |_   '
echo '      \/  \/   |_|           \_____|______|_____|  '
echo '---------------------------------------------------'

# Upgrade the package to the latest.
wp cli update

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "The upgrade is complete."
