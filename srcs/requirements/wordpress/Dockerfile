FROM debian:buster

# Install PHP and necessary extensions
RUN apt-get update && apt-get install -y \
	php-fpm \
    php7.3 \
    php7.3-mysql \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-mbstring \
    php7.3-soap \
    php7.3-xml \
    php7.3-zip

# Install WordPress
WORKDIR /var/www/html/wordpress

RUN apt-get install -y curl && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz && \
    chown -R www-data:www-data wordpress && \
    chmod -R 755 wordpress

# Set up configuration
COPY ./tools/wp-config.php /var/www/html/wordpress

COPY  ./tools/entrypoint.sh /var/www/html/wordpress

# Expose port for PHP-FPM
EXPOSE 9000

# Set up entrypoint
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
