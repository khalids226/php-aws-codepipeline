#!/bin/bash

# Navigate to project directory
cd /var/www/html

# Enable and install PHP 7.4 packages
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install php php-cli php-json php-mbstring php-xml php-pdo php-common php-mysqlnd -y

# Install wget if not already installed
sudo yum install wget -y

# Install Composer if not present
if ! command -v composer &> /dev/null; then
  sudo wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
  sudo chmod +x /usr/local/bin/composer
fi

# Run composer install
sudo composer install --no-interaction --prefer-dist
