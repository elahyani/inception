FROM alpine:3.14.2
EXPOSE 443

RUN apk update && apk upgrade
RUN apk add nginx openssl

RUN mkdir /www

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

ADD conf/nginx.conf /etc/nginx/nginx.conf

RUN printf "MA\nKH\nKH\nORG_NM\nVERV_NM\n_\ninception@project.com\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt


ENTRYPOINT ["nginx", "-g", "daemon off;"]