FROM alpine:3.14.2

RUN apk update && apk upgrade

RUN mkdir backup
RUN mkdir backup/wp_backup
RUN mkdir backup/db_backup

ADD tools/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

CMD ["sh", "/usr/bin/run.sh"]