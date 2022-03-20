#!/bin/sh

mysql_install_db
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DB_TITLE;" | mysql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql
service mysql stop
mysqld

