FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl vim && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/smackere.key \
	-out /etc/ssl/private/smackere.crt \
	-subj "/C=TH/ST=Bangkok/O=42Bangkok/OU=42Bangkok/CN=smackere.42.fr"

COPY conf/nginx.conf /etc/nginx/sites-enabled/default

# EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]