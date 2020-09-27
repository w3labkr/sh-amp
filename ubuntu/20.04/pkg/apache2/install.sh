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

# Start installing the package.
apt -y install apache2 ssl-cert certbot

# Start the package and set it to start on boot.
systemctl stop apache2
systemctl start apache2
systemctl enable apache2

# Activates the specified module within the apache2 configuration.
a2enmod rewrite
a2enmod headers
a2enmod ssl
a2dismod -f autoindex

# Load the changed configuration file.
systemctl reload apache2

# mpm-itk allows you to run each of your vhost under a separate uid and gid—in short,
# the scripts and configuration files for one vhost no longer have to be readable for all the other vhosts.
apt-cache search mpm-itk
apt -y install libapache2-mpm-itk
chmod 711 /home
chmod -R 700 /home/*

# Create a basic SSL configuration file.
if [ -f /etc/apache2/sites-available/default-ssl.conf ]; then
  cp -v /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/000-default-ssl.conf
fi

# Create backup and configuration files.
cp -v /etc/apache2/conf-available/charset.conf{,.bak}
cp -v /etc/apache2/conf-available/security.conf{,.bak}
cp -v /etc/apache2/apache2.conf{,.bak}
cp -v /etc/apache2/mods-available/mpm_prefork.conf{,.bak}
cp -v /etc/apache2/sites-available/000-default.conf{,.bak}
cp -v /etc/apache2/sites-available/000-default-ssl.conf{,.bak}

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
