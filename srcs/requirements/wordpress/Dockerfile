FROM debian:buster

RUN apt-get update \
	apt-get install -y php7.3 \
	php-mysqli \
	php-fpm \
	php-cli \
	curl

COPY ./conf/wp-config.php ./var/www/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/start.sh /bin/start.sh

EXPOSE 9000

ENTRYPOINT [ "bash", "/bin/start.sh" ]