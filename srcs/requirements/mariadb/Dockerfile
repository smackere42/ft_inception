# Используем Debian Buster в качестве базового образа
FROM debian:buster

# Устанавливаем MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client vim && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# Копируем файлы конфигурации
COPY ./tools/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/install.sh     /bin/install.sh

# Экспортируем порт 3306
EXPOSE 3306


ENV env="../../../.env"

ENTRYPOINT ["/bin/install.sh"]

# Запускаем MariaDB при запуске контейнера
# CMD ["mysqld"]s