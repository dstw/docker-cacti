#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
      #code that need to run only one time ....
      
        #to fix problem with data.timezone that appear at 1.28.108 for some reason
        sed -i "s|\;date.timezone =|date.timezone = \"${TZ:-Asia/Jakarta}\"|" /etc/php/7.2/apache2/php.ini
        sed -i "s|\;date.timezone =|date.timezone = \"${TZ:-Asia/Jakarta}\"|" /etc/php/7.2/cli/php.ini
        #needed for fix problem with ubuntu and cron
        sed -i 's/DB_TYPE/'"${DB_TYPE}"'/g' /usr/share/cacti/include/config.php
        sed -i 's/DB_NAME/'"${DB_NAME}"'/g' /usr/share/cacti/include/config.php

        sed -i 's/DB_HOSTNAME/'"${DB_HOSTNAME}"'/g' /usr/share/cacti/include/config.php
        sed -i 's/DB_USERNAME/'"${DB_USERNAME}"'/g' /usr/share/cacti/include/config.php
        sed -i 's/DB_PASSWORD/'"${DB_PASSWORD}"'/g' /usr/share/cacti/include/config.php
        sed -i 's/DB_PORT/'"${DB_PORT}"'/g' /usr/share/cacti/include/config.php
        sed -i 's/DB_SSL/'"${DB_SSL}"'/g' /usr/share/cacti/include/config.php

        sed -i 's/APACHE_SRV_NAME/'"${APACHE_SRV_NAME}"'/g' /etc/apache2/sites-available/000-default.conf
        sed -i 's/APACHE_SRV_ALIAS/'"${APACHE_SRV_ALIAS}"'/g' /etc/apache2/sites-available/000-default.conf
        sed -i 's/APACHE_SRV_ADMIN/'"${APACHE_SRV_ADMIN}"'/g' /etc/apache2/sites-available/000-default.conf

	sed -i 's/session.gc_maxlifetime\ =\ 1440/session.gc_maxlifetime\ =\ 1440000000/g' /etc/php/7.2/apache2/php.ini

	service apache2 restart

	chown -R www-data:www-data /usr/share/cacti/rra

        update-locale 
        date > /etc/configured
fi
