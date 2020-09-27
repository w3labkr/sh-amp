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

# Install certbot
# https://www.vultr.com/docs/setup-letsencrypt-on-linux
apt update && apt -y install certbot python-certbot-apache

# Install Certificate
#certbot --apache --redirect -d example.com -d www.example.com -m admin@example.com --agree-tos

# Verify Automatic Renewal
#systemctl list-timers | grep 'certbot\|ACTIVATES'
#ls -l /etc/cron.d/certbot
#certbot renew --dry-run

# Print a completion message.
echo
echo "Installation is complete."
