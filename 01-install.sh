#!/bin/bash
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y apache2
sudo ufw allow in "Apache Full"
sudo apt-get install -y mysql-server

# After running this command, select (Y), option 2, then (Y) for the rest of the prompts.
sudo service mysql start
sudo mysql_secure_installation

sudo apt install -y php5.6 libapache2-mod-php5.6 php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-xmlrpc

# This will, and should, return a "already enabled" message.
sudo a2enmod php5.6

sudo systemctl restart apache2

# composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

# Reference
# https://gist.github.com/ericfledderman/6c4f0f7e6ffa3477372ebf5392bad6cd