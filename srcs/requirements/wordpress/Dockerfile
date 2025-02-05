# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client

# copy the wordpress configuration script to the root directory in the container
COPY ./wp_conf.sh /

# create the wordpress directory
RUN mkdir -p /var/www/wordpress

# change the owner of the wordpress directory to www-data
RUN chown -R www-data:www-data /var/www/wordpress

# change the permission of the script to make it executable
RUN  chmod +x wp_conf.sh

EXPOSE 9000

# define the command to run when the container starts
CMD ["./wp_conf.sh"]