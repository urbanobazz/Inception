# Inherit from the official Alpine image
FROM debian:bullseye

# set the port for the container
EXPOSE 443

# Install the nginx package and prerequisites && clean up the apt cache and remove the package lists(reduces the image size).
RUN apt update && apt install -y nginx openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Generate a self-signed X.509 certificate (SSL) and a new private key.
RUN openssl req -x509 -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj	"/C=DE\
			/ST=Berlin\
			/L=Berlin\
			/O=42_Berlin\
			/OU=Student\
			/CN=ubazzane.42.fr"

# Copy the nginx configuration file to the container
COPY ./nginx.conf /etc/nginx/nginx.conf

# Run the nginx server in the foreground (daemon off)
CMD ["nginx", "-g", "daemon off;"]

