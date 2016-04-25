FROM debian 
MAINTAINER Brice Dereims "bdereims@gmail.com"

ADD ./phpipam-1.2.1.tar /tmp/phpipam-1.2.1.tar 

RUN apt-get update

RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install git apache2 php5 libapache2-mod-php5 php5-gd \
	php5-gd php-xml-parser php5-intl php-pear php5-curl php5-mysql php5-json php5-gmp php5-mcrypt php5-ldap \ 
	libgmp-dev libmcrypt-dev vim && \ 
	cd /var/www/ && \
	# git clone https://github.com/phpipam/phpipam.git && \ 
	mv /tmp/phpipam-1.2.1.tar/phpipam /var/www/phpipam && \
	chown -R www-data:www-data * && \
	rm -fr html && mv phpipam html && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	a2enmod rewrite && php5enmod mcrypt

RUN mv /var/www/html/config.dist.php /var/www/html/config.php && \
	sed -i \ 
	-e "s/\['host'\] = \"localhost\"/\['host'\] = getenv(\"MYSQL_SERVER\")/" \ 
	-e "s/\['user'\] = \"phpipam\"/\['user'\] = getenv(\"MYSQL_USER\")/" \ 
	-e "s/\['pass'\] = \"phpipamadmin\"/\['pass'\] = getenv(\"MYSQL_PASSWD\")/" \ 
	/var/www/html/config.php

ADD ./startup.sh /opt/startup.sh

EXPOSE 80

CMD ["/bin/bash", "/opt/startup.sh"]
