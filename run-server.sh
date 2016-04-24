#!/bin/sh

docker run -d -p 8080:80 --name phpipam -e MYSQL_SERVER=172.16.184.6 -e MYSQL_USER=admin -e MYSQL_PASSWD=changeme bdereims/phpipam
