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
echo
echo '------------------------------------------'
echo '   ______    _ _ ___  _                   '
echo '  |  ____|  (_) |__ \| |                  '
echo '  | |__ __ _ _| |  ) | |__   __ _ _ __    '
echo '  |  __/ _  | | | / /|  _ \ / _  |  _ \   '
echo '  | | | (_| | | |/ /_| |_) | (_| | | | |  '
echo '  |_|  \__,_|_|_|____|_.__/ \__,_|_| |_|  '
echo '------------------------------------------'

# Start installing the package.
apt -y install fail2ban whois

# Start the package and set it to start on boot.
systemctl stop fail2ban
systemctl start fail2ban
systemctl enable fail2ban

# Create backup and configuration files.
cp -v /etc/fail2ban/jail.conf{,.bak}
cp -v /etc/fail2ban/jail.local{,.bak}

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
