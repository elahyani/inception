FROM alpine:3.14.2

EXPOSE 3000

RUN apk update && apk upgrade
RUN apk add npm
RUN npm install -g http-server
RUN mkdir /www

ADD tools/index.html /www/index.html

CMD ["http-server", "-p 3000", "/www"]