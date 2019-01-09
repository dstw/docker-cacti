# docker-cacti

Docker container for [cacti 1.1.38][3].

"Cacti is a complete network graphing solution designed to harness the power of [RRDTool's][6] data storage and graphing functionality. Cacti provides a fast poller, advanced graph templating, multiple data acquisition methods, and user management features out of the box. All of this is wrapped in an intuitive, easy to use interface that makes sense for LAN-sized installations up to complex networks with hundreds of devices."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 18.04 use the commands:

    $ sudo apt-get update
    $ sudo wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Built-in plugin

Included three additional plugin:

 scripts/http_response_time.pl: to check HTTP response time from a URL  
 scripts/http_status_code.pl: to check HTTP status code from a URL  
 scripts/postgresql.php: to count active query session on PGSQL DB  

## More Info

About Cacti [www.cacti.net][1]

Modified by: Didik Setiawan

Based on [quantumobject/docker-cacti][5]

[1]:http://www.cacti.net/
[2]:https://www.docker.com
[3]:http://www.cacti.net/
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-cacti
[6]:http://oss.oetiker.ch/rrdtool
