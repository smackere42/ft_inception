#!/bin/bash

# Wait for the database to be ready
# while ! mysqladmin ping -hdb --silent; do
#   sleep 1
# done

# Set up the WordPress configuration file
# cp /var/www/html/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_NAME', 'database_name_here')/define('DB_NAME', '$WORDPRESS_DB_NAME')/" /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_USER', 'username_here')/define('DB_USER', '$WORDPRESS_DB_USER')/" /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_PASSWORD', 'password_here')/define('DB_PASSWORD', '$WORDPRESS_DB_PASSWORD')/" /var/www/html/wordpress/wp-config.php
sed -i "s/define('DB_HOST', 'localhost')/define('DB_HOST', 'db')/" /var/www/html/wp-config.php

# Set up Nginx configuration file
sed -i "s/server_name _;/server_name $DOMAIN_NAME;/" /etc/nginx/conf.d/default.conf

# Start PHP-FPM and Nginx
php-fpm7
nginx -g "daemon off;"