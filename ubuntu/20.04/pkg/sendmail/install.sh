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
echo "Installation begins."
echo
echo '-------------------------------------------------'
echo '    _____                _                 _ _   '
echo '   / ____|              | |               (_) |  '
echo '  | (___   ___ _ __   __| |_ __ ___   __ _ _| |  '
echo '   \___ \ / _ \  _ \ / _  |  _   _ \ / _  | | |  '
echo '   ____) |  __/ | | | (_| | | | | | | (_| | | |  '
echo '  |_____/ \___|_| |_|\__,_|_| |_| |_|\__,_|_|_|  '
echo '-------------------------------------------------'

# Start installing the package.
apt -y install sendmail

# Start the package and set it to start on boot.
systemctl stop sendmail
systemctl start sendmail
systemctl enable sendmail

# Create backup and configuration files.
cp -v /etc/mail/local-host-names{,.bak}

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
