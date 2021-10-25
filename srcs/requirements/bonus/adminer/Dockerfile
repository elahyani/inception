FROM alpine

RUN apk update && apk upgrade
# RUN mkdir /www
RUN apk add php php-curl php-cli php-mysqli php-gd php-fpm
RUN wget https://github.com/vrana/adminer/releases/download/v4.7.3/adminer-4.7.3.php
RUN mv adminer-4.7.3.php adminer.php
RUN chmod 755 adminer.php
# CMD ["php-fpm", "-F", "-R"]
CMD ["php", "-S", "localhost:5000/adminer.php"]