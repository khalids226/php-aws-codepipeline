!/bin/bash
if ! [ -x "$(command -v httpd)" ]; then sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2 >&2;   exit 1; fi # install apache if not already installed

