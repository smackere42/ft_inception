FROM debian:buster

RUN apt-get update && \
	apt-get install -y php7.3 \
	php-mysqli \
	php-fpm \
	php-cli \
	curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/start.sh ./conf/wp-config.php /var/www/

EXPOSE 9000

# static website
# COPY conf/index.html /var/www/index.html

ENTRYPOINT ["bash", "/var/www/start.sh"]