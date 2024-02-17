#!/bin/bash
cd /var/www/html
sudo yum install wget php-cli php-json -y  # Install wget and required PHP packages
sudo wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer  # Download Composer
sudo chmod +x /usr/local/bin/composer  # Make Composer executable system-wide
sudo composer install  # Use Composer to install project dependencies
