#! /bin/bash

#site name
site_name=$1

#project web root
doc_root=$2

#ubuntu's apache directory
config_dir='/etc/apache2/sites-available'

#goes to dir
cd "$config_dir"

#create vhost config
echo "<VirtualHost *:80>
  ServerName $site_name.localhost
  DocumentRoot $doc_root
</VirtualHost>" > "$site_name"

#enable new vhost
a2ensite "$site_name"

#add a entry to hosts file
echo "127.0.0.1 $site_name.localhost" >> /etc/hosts

#restart apache
service apache2 restart

