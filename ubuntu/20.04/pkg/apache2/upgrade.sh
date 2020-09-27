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
echo
echo '-----------------------------------------------'
echo '                             _          ___    '
echo '      /\                    | |        |__ \   '
echo '     /  \   _ __   __ _  ___| |__   ___   ) |  '
echo '    / /\ \ |  _ \ / _  |/ __|  _ \ / _ \ / /   '
echo '   / ____ \| |_) | (_| | (__| | | |  __// /_   '
echo '  /_/    \_\ .__/ \__,_|\___|_| |_|\___|____|  '
echo '           | |                                 '
echo '           |_|                                 '
echo '-----------------------------------------------'

# Stop the package.
systemctl stop apache2

# Upgrade the package to the latest.
apt -y install --only-upgrade apache2 ssl-cert certbot libapache2-mpm-itk

# Start the package.
systemctl start apache2

# Print a completion message.
echo
echo "The upgrade is complete."
