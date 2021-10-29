#!/bin/sh

sed -i "s/db_name/${MYSQL_DATABASE}/g" /www/wordpress/wp-config.php
sed -i "s/db_user/${MYSQL_USER}/g"  /www/wordpress/wp-config.php
sed -i "s/db_password/${MYSQL_PASSWORD}/g"  /www/wordpress/wp-config.php
sed -i "s/db_host/${WORDPRESS_DB_HOST}/g"  /www/wordpress/wp-config.php

sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf

php-fpm7 -F -R