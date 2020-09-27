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
echo "Uninstallation begins."
echo
echo '------------------------------------'
echo '  __      __   __ _             _   '
echo '  \ \    / /  / _| |           | |  '
echo '   \ \  / /__| |_| |_ _ __   __| |  '
echo '    \ \/ / __|  _| __|  _ \ / _  |  '
echo '     \  /\__ \ | | |_| |_) | (_| |  '
echo '      \/ |___/_|  \__| .__/ \__,_|  '
echo '                     | |            '
echo '                     |_|            '
echo '------------------------------------'

# Stop the package.
systemctl stop vsftpd

# Remove the package completely.
apt remove vsftpd
apt purge vsftpd
apt autoremove

# If the directory still exists, delete it.
if [ -d /etc/vsftpd ]; then
  rm -rf /etc/vsftpd
fi

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Removal is complete."