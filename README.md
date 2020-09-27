# Amp Stack Init

## Description
We recommend using this script if you want to install minimal packages for virtual hosts.   
This script allows you to quickly and easily install the latest version of the amp stack.   
Currently only available on Ubuntu 18 version or higher.   

---

## Directory Structure
```
o
|-- OS-NAME
|   `-- 20.04
|       |-- os
|       `-- pkg
|-- install.sh
|-- uninstall.sh
|-- update.sh
`-- upgrade.sh
```

--- 


## Download and Install the Script
```
$ sudo su
$ git clone https://github.com/w3labkr/sh-amp-init.git
$ cd sh-amp-init
$ chmod +x ./*.sh
$ ./install.sh
```

---

## Syntax

All packages are executed.
```
$ ./<command>.sh
```

The specific package is executed.
```
$ ./<command>.sh --<package-name> ...
```

---

## Usage

**Install**   
The apache2, certbot, fail2ban, mariadb, php, sendmail, vsftpd, wp-cli packages will be installed.
```
$ ./install.sh
```

**Upgrade**   
Run the package's apt upgrade.
```
$ ./upgrade.sh
```

**Uninstall**   
Remove the package completely.
```
$ ./uninstall.sh
```

**Update**   
Download the latest version of the Amp Stack Init.
```
$ ./update.sh
```

---

### List of installed php modules for wordpress and laravel   
For more information on [wordpress](https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions) and [laravel](https://laravel.com/docs/7.x#server-requirements), see here.   
```
php-common
libapache2-mod-php
php-mysql
php-curl
php-json
php-mbstring
php-imagick
php-xml
php-zip
php-gd
php-ssh2
php-bcmath
php-json
php-xml
php-mbstring
php-tokenizer
php-oauth
composer
```

---

## License
[MIT License](LICENSE)   
