FROM alpine:3.14.2

RUN apk update && apk upgrade
COPY tools/index.html /www/index.html

CMD ["nginx", "-g", "daemon off;"]