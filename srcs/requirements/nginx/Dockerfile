# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y nginx openssl

# create the ssl directory
RUN mkdir -p /etc/nginx/ssl

# generate the ssl certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=malanglo.42.fr/UID=malanglo"

# copy the nginx configuration file
COPY ./nginx.conf /etc/nginx/nginx.conf

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

EXPOSE 443

# define the command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]