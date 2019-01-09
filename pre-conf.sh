#!/bin/bash

cd /usr/share/cacti/plugins
# download the source
git clone -b master https://github.com/Cacti/plugin_thold.git
# rename it to thold, yes it matters...
mv plugin_thold thold

touch /usr/share/cacti/log/cacti.log
chown -R www-data:www-data /usr/share/cacti/log
chown -R www-data:www-data /usr/share/cacti/rra
 
#to fix error relate to ip address of container apache2
echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf

# to create a link for the cacti web directory
ln -s /usr/share/cacti/ /var/www/html/cacti
ln -s /usr/bin/snmpwalk /bin/snmpwalk
ln -s /usr/bin/snmpget /bin/snmpget
ln -s /usr/bin/snmpbulkwalk /bin/snmpbulkwalk
ln -s /usr/bin/snmpgetnext /bin/snmpgetnext
ln -s /usr/bin/snmptrap /bin/snmptrap
ln -s /usr/bin/rrdtool /bin/rrdtool
ln -s /usr/bin/php /bin/php

#configure poller Crontab
echo "*/5 * * * * www-data php /usr/share/cacti/poller.php > /dev/null 2>&1" >> /etc/crontab 

cd /usr/share/
wget http://www.cacti.net/downloads/spine/cacti-spine-latest.tar.gz
ver=$(tar -tf cacti-spine-latest.tar.gz | head -n1 | tr -d /)
tar -xvf /usr/share/cacti-spine-latest.tar.gz
cd /usr/share/$ver/
./configure
make
make install
ln -s /usr/share/$ver/spine /bin/spine
