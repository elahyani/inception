#!bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
	/etc/init.d/mariadb setup
	sleep 1
    /usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=root --pid-file=/run/mysqld/mariadb.pid
	mysql -u root -e "create user 'admin'@'%' identified by 'admin1234'"
	mysql -u root -e "create database wordpress"
	mysql -u root -e "grant all privileges on *.* to 'admin'@'%'"
	mysql -u root -e "flush privileges"
	mysql -u root -e "quit"
	# rc-service mariadb restart
	# mysql -u root < /wordpress.sql
fi