FROM alpine:3.14.2

RUN apk update && apk upgrade
RUN apk add nginx
RUN mkdir /www

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD tools/index.html /www/index.html

CMD ["npm", "run", "index.js"]