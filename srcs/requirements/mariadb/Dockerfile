FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client
RUN rc-status
RUN touch /run/openrc/softlevel

# ADD conf/wordpress.sql /
ADD tools/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT ["sh", "/usr/bin/run.sh"]