FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client
RUN rc-status
RUN touch /run/openrc/softlevel

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}


ADD conf/wordpress.sql /
ADD tools/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT ["sh", "/usr/bin/run.sh"]