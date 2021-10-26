FROM alpine:3.14.2

RUN apk update && apk upgrade
RUN apk add redis php7-redis

ADD tools/run.sh /usr/bin/run.sh
ENTRYPOINT [ "sh", "/usr/bin/run.sh" ]