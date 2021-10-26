#!/bin/sh

index=0;
touch /backup/backup_history.txt

while true
do
    index=$(( $index + 1 ))
    echo "backup $index - [`date`]" >> /backup/backup_history.txt
    mkdir /backup/wp_backup/wp-bkp-$index
    cp -rf /www/wordpress/* /backup/wp_backup/wp-bkp-$index
    mkdir /backup/db_backup/db-bkp-$index
    cp -rf /var/lib/mysql/* /backup/db_backup/db-bkp-$index
    sleep 300 
done

exit 0