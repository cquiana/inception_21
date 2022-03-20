FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get install -y \
    php-fpm wget php-mysql php-mbstring php-gd php-xml
RUN mkdir -p /run/php /var/www/html
RUN touch /run/php/php7.3-fpm.pid
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

RUN  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN  chmod +x wp-cli.phar &&  mv wp-cli.phar /usr/local/bin/wp


COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

ENTRYPOINT [ "sh", "/tmp/setup.sh" ]

# CMD /usr/sbin/php-fpm7.3 -F -R
