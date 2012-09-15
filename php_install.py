#! /usr/bin/python

import os

os.system("""
apt-get install mysql-server
apt-get isntall mysql-client
apt-get install libxml2-dev
apt-get install libicu-dev
apt-get install g++
	""")

opts = ["--with-mysql", "--with-pdo-mysql", "--enable-mbstring", "--enable-intl",
    "--with-openssl", "--with-zlib"]

os.system("./configure " + " ".join(opts))

os.system("""
make
make install
	""")