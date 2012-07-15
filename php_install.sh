#! /bin/bash

apt-get install apache2-threaded-dev
apt-get install libxml2-dev
apt-get install libicu-dev
sudo apt-get install g++

./configure --with-apxs2=/usr/bin/apxs2 --with-mysql --enable-mbstring --enable-intl