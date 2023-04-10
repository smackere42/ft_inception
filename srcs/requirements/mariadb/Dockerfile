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
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/install.sh     /bin/install.sh

# Экспортируем порт 3306
EXPOSE 3306

ENTRYPOINT ["bash", "/bin/install.sh"]
