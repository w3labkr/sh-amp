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

# Make sure the script is running as root.
if [ "$(whoami)" != 'root' ]; then
  echo "Non-super admin users do not have permission to execute $0."
  echo "Use it as a super administrator."
  exit 0
fi

# Make sure you have git installed.
if [! command -v git &>/dev/null]; then
  echo >&2 "I require git but it's not installed.  Aborting."
  exit 1
fi

# Recursive chmod to make all .sh files in the directory executable.
find ./ -type f -name "*.sh" -exec chmod +x {} +

# Print a welcome message.
echo
echo "Installation begins."
echo
echo '---------------------------------------------------'
echo '  __          __  _                            _   '
echo '  \ \        / / | |                          | |  '
echo '   \ \  /\  / /__| | ___ ___  _ __ ___   ___  | |  '
echo '    \ \/  \/ / _ \ |/ __/ _ \|  _   _ \ / _ \ | |  '
echo '     \  /\  /  __/ | (_| (_) | | | | | |  __/ |_|  '
echo '      \/  \/ \___|_|\___\___/|_| |_| |_|\___| (_)  '
echo '                                                   '
echo '---------------------------------------------------'

# ...

# Print a completion message.
echo
echo "Installation is complete."
echo
echo '-------------------------------------------------------------------------------'
echo '   _    _                                 _                _               _   '
echo '  | |  | |                               (_)              | |             | |  '
echo '  | |__| | __ ___   _____    __ _   _ __  _  ___ ___    __| | __ _ _   _  | |  '
echo '  |  __  |/ _  \ \ / / _ \  / _  | |  _ \| |/ __/ _ \  / _  |/ _  | | | | | |  '
echo '  | |  | | (_| |\ V /  __/ | (_| | | | | | | (_|  __/ | (_| | (_| | |_| | |_|  '
echo '  |_|  |_|\__,_| \_/ \___|  \__,_| |_| |_|_|\___\___|  \__,_|\__,_|\__, | (_)  '
echo '                                                                    __/ |      '
echo '                                                                   |___/       '
echo '-------------------------------------------------------------------------------'
