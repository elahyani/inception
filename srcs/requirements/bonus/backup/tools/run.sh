#!/bin/sh

curr_date=`date +%d-%m-%y_%T`

touch /backup/backup_history.txt

echo "data backed up - [`date`]" >> /backup/backup_history.txt
mkdir /backup/wp_backup/wp-bkp$curr_date
cp -rf /www/wordpress/* /backup/wp_backup/wp-bkp$curr_date
mkdir /backup/db_backup/db-bkp$curr_date
cp -rf /var/lib/mysql/* /backup/db_backup/db-bkp$curr_date
