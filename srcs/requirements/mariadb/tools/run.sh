#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start
	mysql -u root -e "DELETE FROM mysql.user WHERE user=''; FLUSH PRIVILEGES;"
	mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* to '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; FLUSH PRIVILEGES;"
	mysql -u root wordpress < /wordpress.sql
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
	/etc/init.d/mariadb stop
fi
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
/etc/init.d/mariadb restart
/etc/init.d/mariadb stop

/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=root --pid-file=/run/mysqld/mariadb.pid