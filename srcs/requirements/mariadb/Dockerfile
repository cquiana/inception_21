FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 744 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./setup.sh /tmp/setup.sh


CMD ["sh", "/tmp/setup.sh"]
