#!/bin/bash

# MYSQL_NAME=mariadb
# MYSQL_ROOT_PASSWORD=root_mdb
# MYSQL_USER=mysql
# MYSQL_PASSWORD=Inception1@

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

chmod +x /bin/install.sh

echo -e "${BLUE}Removing existing MySQL data directory (if not empty)...${NC}"
rm -rf /var/lib/mysql

echo -e "${BLUE}Creating new MySQL data directory...${NC}"
mkdir -p /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

echo -e "${BLUE}Installing MariaDB system tables...${NC}"
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

echo -e "${BLUE}Starting MariaDB server...${NC}"
mysqld -u mysql --skip-bind-address &
mariadb_pid=$!

echo -e "${BLUE}Waiting for MariaDB server to start up...${NC}"
until mariadb -u root -e ";" >/dev/null 2>&1; do
    sleep 1
done

mysql -u root -e "USE mysql;FLUSH PRIVILEGES;"

echo -e "${BLUE}Removing test database and anonymous user...${NC}"
mysql -u root -e "DELETE FROM mysql.user WHERE User='';DROP DATABASE test;"

echo -e "${BLUE}Creating new database...${NC}"
mysql -u root -e "CREATE DATABASE ${WORDPRESS_DB_NAME};"

echo -e "${BLUE}Creating new user for database...${NC}"
mysql -u root -e "CREATE USER ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo -e "${BLUE}Granting privileges to new user...${NC}"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO ${MYSQL_USER}@'%';"

echo -e "${BLUE}Flushing privileges...${NC}"
mysql -u root -e "FLUSH PRIVILEGES;"

echo -e "${BLUE}Updating root user password...${NC}"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

echo -e "${BLUE}Stopping MariaDB server...${NC}"
kill $mariadb_pid
wait $mariadb_pid

echo -e "${GREEN}Database successfully set up!${NC}${GREEN}"

echo  "\n\t${RED}${MYSQL_NAME}${RED}\n"

exec mysqld --user=mysql --console
