FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nginx openssl

#SSL
RUN openssl req -x509 -nodes -sha256 -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/certs/selfsigned.key \
	-out /etc/ssl/certs/selfsigned.crt \
	-subj '/C=RU/ST=Moscow/L=Moscow/O=21school/OU=no/CN=cquiana/'

COPY ./nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
