FROM alpine:3.14.2

EXPOSE 21

RUN apk update
RUN apk add vsftpd openssl openssh

RUN printf "MA\nKH\nKH\nORG_NM\nVERV_NM\n_\ninception@project.com\n" | openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem


ADD conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

ADD tools/run.sh /usr/bin/run.sh

RUN chmod +x /usr/bin/run.sh

ENTRYPOINT [ "sh", "/usr/bin/run.sh" ]
