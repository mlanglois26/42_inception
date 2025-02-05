# pull base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y mariadb-server netcat

# copy file from host to container
COPY ./mariadb-conf.sh /mdb-conf.sh

# set permissions to the file
RUN chmod +x /mdb-conf.sh

# define command to run when the container starts
ENTRYPOINT ["./mdb-conf.sh"]