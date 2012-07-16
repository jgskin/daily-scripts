#! /bin/bash

#install suexec for apache
apt-get install apache2-suexec
apt-get install libapache2-mod-fastcgi

#enable modules
a2enmod suexec
a2enmod actions
a2enmod fastcgi

#restart apache
service apache2 restart