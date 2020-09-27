#!/bin/bash
#
# Download and run the latest release version.
# https://github.com/w3labkr/sh-amp-init
#
# Usage
# git clone https://github.com/w3labkr/sh-amp-init.git
# cd sh-amp-init
# chmod +x ./update.sh
# ./update.sh

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

#
# lsb_release command is only work for Ubuntu platform but not in centos
# so you can get details from /etc/os-release file
# following command will give you the both OS name and version-
#
# https://askubuntu.com/questions/459402/how-to-know-if-the-running-platform-is-ubuntu-or-centos-with-help-of-a-bash-scri
OS_NAME="$(cat /etc/os-release | awk -F '=' '/^NAME=/{print $2}' | awk '{print $1}' | tr -d '"')"

if [ "${OS_NAME}" == "Ubuntu" ]; then
  OS_ID="ubuntu"
  OS_VERSION_ID="$(cat /etc/os-release | awk -F '=' '/^VERSION_ID=/{print $2}' | awk '{print $1}' | tr -d '"')"
  OS_VERSION_NUMBER="${OS_VERSION_ID//./}"
  if [ "${OS_VERSION_NUMBER}" -lt "1804" ]; then
    echo "Sorry. Not supported on Ubuntu below 18.04."
    exit 0
  else
    OS_VERSION_ID="18.04"
  fi
elif [ "${OS_NAME}" == "CentOS" ]; then
  echo "Sorry. Not supported on CentOS."
  exit 0
else
  echo "Sorry. Not supported on ${OS_NAME}."
  exit 0
fi

# Print a welcome message.
echo
echo "The upgrade begins."
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

#...

# Print a completion message.
echo
echo "The upgrade is complete."
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
