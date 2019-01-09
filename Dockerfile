FROM dstw/cacti:1

MAINTAINER Didik Setiawan  "didik.setiawan@myrepublic.net"

# add files and script that need to be use for this container
COPY config.php /usr/share/cacti/include/config.php
COPY apache2.conf /etc/apache2/sites-available/000-default.conf

##startup scripts
#Pre-config scrip that maybe need to be run one time only when the container run the first time .. using a flag to don't
#run it again ... use for conf for service ... when run the first time ...
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

# to allow access from outside of the container to the container service
# at that ports need to allow access from firewall if need to access it outside of the server.
EXPOSE 80
