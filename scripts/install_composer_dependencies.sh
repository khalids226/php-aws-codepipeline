#!/bin/bash
set -e  # Exit immediately on error
set -x  # Print each command

cd /var/www/html

# Enable PHP 7.4 without interaction
sudo amazon-linux-extras enable php7.4 -y || true
sudo yum clean metadata
sudo yum install php php-cli php-json php-mbstring php-xml php-pdo php-common php-mysqlnd wget -y --setopt=skip_if_unavailable=true

# Install Composer if missing
if ! command -v composer &> /dev/null; then
  sudo wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
  sudo chmod +x /usr/local/bin/composer
fi

# Run composer install with memory-efficient flags
sudo composer install --no-interaction --prefer-dist --no-scripts --no-dev
