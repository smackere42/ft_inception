FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/private/nginx.crt \
	-subj "/C=TH/ST=Bangkok/O=42Bangkok/OU=42Bangkok/CN=smackere.42.fr"

COPY tools/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]