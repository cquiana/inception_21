#!/bin/sh

if [ -e /var/www/html/wp-config.php ]
then
	echo "wp-config already exists"
else
  cd /var/www/html/
  wp core download --allow-root
  mv ./wp-config.php /var/www/html/
  echo "Configuring Wordpress parameters"
  wp config create --allow-root --path=/var/www/html/ --dbname=${DB_TITLE} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --dbprefix=wp_ --skip-check
  echo "Installing Wordpress"
  wp core install --allow-root --path=/var/www/html/ --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_MAIL}
  echo "Creating user beto"
  wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user_pass=${WP_USER_PASS}
fi
exec "$@"
