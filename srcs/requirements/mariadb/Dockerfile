FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/install.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/install.sh"]