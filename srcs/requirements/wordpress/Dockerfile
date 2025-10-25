FROM debian:latest

RUN apt update && apt upgrade && apt install -y php-fpm curl

COPY conf/www.conf /etc/php/8.4/fpm/pool.d/.

CMD ["php-fpm8.4", "-F"]