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

# Installing php extensions for amp.
apt -y install php php-common libapache2-mod-php php-mysql

# Required php extensions for wordpress.
# https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions
apt -y install php-curl php-json php-mbstring php-imagick php-xml php-zip php-gd php-ssh2

# Required php extensions for laravel.
# https://laravel.com/docs/7.x#server-requirements
apt -y install php-bcmath php-json php-xml php-mbstring php-tokenizer composer

# Required php extensions for cloud API.
apt -y install php-oauth

# Search php modules.
#apt-cache search php- | grep ^php- | grep module

# Get php version
PHP_VERSION="$(php -v | awk '/^PHP/{print $2}' | awk -F "-" '{print $1}')"
PHP_MAJOR_VERSION="${PHP_VERSION%%.*}"
PHP_MINOR_VERSION="${PHP_VERSION%.*}"
PHP_RELEASE_VERSION="${PHP_VERSION}"

# Create backup and configuration files.
cp -v /etc/apache2/mods-available/dir.conf{,.bak}
cp -v /etc/apache2/mods-available/php${PHP_MINOR_VERSION}.conf{,.bak}
cp -v /etc/php/${PHP_MINOR_VERSION}/apache2/php.ini{,.bak}

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
