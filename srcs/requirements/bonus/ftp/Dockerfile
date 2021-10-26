FROM alpine:3.14.2

RUN apk update
RUN apk add vsftpd openssl openssh

RUN printf "MA\nKH\nKH\nORG_NM\nVERV_NM\n_\nftserver@projetc.com\n" | openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

RUN adduser -D elahyani && echo "elahyani:12341234" | chpasswd
RUN ssh-keygen -A

ADD conf/vsftpd.conf /etc/vsftpd/vsftpd.conf 

CMD /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
