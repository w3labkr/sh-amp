# Amp Stack Init

## Description

We recommend using this script if you want to install minimal packages for virtual hosts.   
This script allows you to quickly and easily install the latest version of the amp stack.   
Currently only available on Ubuntu 18 version or higher.   

---

## Firewall

The following ports must be opened.

- http: 80/tcp   
- https: 443/tcp   
- ssh: 22/tcp   
- ftp: data: 20/tcp   
- ftp: command: 21/tcp   
- ftp: require implicit FTP over TLS port: 990/tcp   
- ftp: passive ports range port: 12000:12100/tcp   
- mysql: 3306/tcp, 5432/tcp   
- mariadb: 3306/tcp, 5432/tcp   
- smtp: 25/tcp, 465/tcp, 587/tcp, 2525/tcp   
- pop3: 110/tcp, 995/tcp   
- imap: 143/tcp, 993/tcp   

Opening the following ports is optional.   

- memcached: 11211/tcp   
- redis: 6379/tcp   
- elasticsearch: 9200/tcp   

---


## Download and Install the Script

This script requires root permission.
```
$ sudo su
$ git clone https://github.com/w3labkr/amp-init.git
$ cd amp-init
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

## List of installed php modules for wordpress and laravel

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
