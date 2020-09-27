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
echo '---------------------------------------------------'
echo '  __          _______         _____ _      _____   '
echo '  \ \        / /  __ \       / ____| |    |_   _|  '
echo '   \ \  /\  / /| |__) |_____| |    | |      | |    '
echo '    \ \/  \/ / |  ___/______| |    | |      | |    '
echo '     \  /\  /  | |          | |____| |____ _| |_   '
echo '      \/  \/   |_|           \_____|______|_____|  '
echo '---------------------------------------------------'

# Once you've verified requirements, download the wp-cli.phar file using wget or curl:
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Next, check the Phar file to verify that it's working:
php wp-cli.phar --info

# To use WP-CLI from the command line by typing wp, make the file executable and move it to somewhere in your PATH. For example:
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# If WP-CLI was installed successfully, you should see something like this when you run wp --info:
wp --info

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
