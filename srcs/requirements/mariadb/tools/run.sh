#!bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start
	mysql -u root -e "flush privileges"
	mysql -u root -e "create user 'elahyani'@'%' identified by 'bIJ2rwW'"
	mysql -u root -e "create database wordpress"
	mysql -u root -e "grant all privileges on *.* to 'elahyani'@'%' identified by 'bIJ2rwW'"
	mysql -u root -e "flush privileges"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'slhfdfj'"
	mysql -u root -p slhfdfj "flush privileges"
	/etc/init.d/mariadb stop
	# mysql -u root < /wordpress.sql
fi
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
/etc/init.d/mariadb restart
/etc/init.d/mariadb stop

/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=root --pid-file=/run/mysqld/mariadb.pid