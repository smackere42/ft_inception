#!/bin/bash

# BLUE='\033[0;34m'
# GREEN='\033[0;32m'
# RED='\033[0;31m'
# NC='\033[0m'

# chmod +x /bin/install.sh

# echo -e "${BLUE}Removing existing MySQL data directory (if not empty)...${NC}"
# rm -rf /var/lib/mysql

# echo -e "${BLUE}Creating new MySQL data directory...${NC}"
# mkdir -p /var/lib/mysql /var/run/mysqld
# chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# echo -e "${BLUE}Installing MariaDB system tables...${NC}"
# mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# echo -e "${BLUE}Starting MariaDB server...${NC}"
# mysqld -u mysql --skip-bind-address &
# mariadb_pid=$!

# echo -e "${BLUE}Waiting for MariaDB server to start up...${NC}"
# until mariadb -u root -e ";" >/dev/null 2>&1; do
#     sleep 1
# done

# echo -e "${BLUE}Removing test database and anonymous user...${NC}"
# mariadb -u root -e "DROP DATABASE IF EXISTS test; DELETE FROM mysql.user WHERE User='';"

# echo -e "${BLUE}Creating new database...${NC}"
# mariadb -u root -e "CREATE DATABASE ${MYSQL_NAME};"

# echo -e "${BLUE}Creating new user for database...${NC}"
# mariadb -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# echo -e "${BLUE}Granting privileges to new user...${NC}"
# mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';"

# echo -e "${BLUE}Flushing privileges...${NC}"
# mariadb -u root -e "FLUSH PRIVILEGES;"

# echo -e "${BLUE}Updating root user password...${NC}"
# mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# # echo -e "${BLUE}Stopping MariaDB server...${NC}"
# # kill $mariadb_pid
# # wait $mariadb_pid

# echo -e "${GREEN}Database successfully set up!${NC}${GREEN}${MYSQL_NAME}"

# mysqld

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi

	# https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw
	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
CREATE DATABASE $WP_DATABASE_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED by '$WP_DATABASE_PWD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%';
FLUSH PRIVILEGES;
EOF
	# run init.sql
	/usr/bin/mysqld --user=mysql --bootstrap < $tfile
	rm -f $tfile
fi

# allow remote connections
# sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

mysqld --user=mysql --console