#!/bin/sh

adduser -D ${FTP_USER}

echo "${FTP_USER}:${FTP_USER_PASSWORD}" | chpasswd

chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}

ssh-keygen -A

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf