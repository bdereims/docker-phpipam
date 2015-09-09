#!/bin/sh

docker run -d -p 3306:3306 -p 8081:80 -v /data/raid1/Docker/mysql-phpmyadmin:/var/lib/mysql bdereims/mysql-phpmyadmin
