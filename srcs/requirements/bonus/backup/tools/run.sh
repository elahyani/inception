#!/bin/sh

touch /backup/backup_history.txt

echo "data backed up - [`date`]" >> /backup/backup_history.txt
mkdir /backup/wp_backup/wp-bkp
cp -rf /www/wordpress/* /backup/wp_backup/wp-bkp
mkdir /backup/db_backup/db-bkp
cp -rf /var/lib/mysql/* /backup/db_backup/db-bkp
