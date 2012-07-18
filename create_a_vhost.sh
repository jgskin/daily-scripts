#! /bin/bash

#site name
site_name=$1

#project web root
doc_root=$2

#with fast-cgi?
cgi_script=$3

#ubuntu's apache directory
config_dir='/etc/apache2/sites-available'

#goes to dir
cd "$config_dir"

if [ "$cgi_script" != "" ]; then
    #configure fast cgi opt
    fcgi_config="
        ScriptAlias /fcgi-bin /var/www/cgi-bin

        <IfModule mod_fastcgi.c>
                SuexecUserGroup web web
                <Directory $doc_root>
			Options +ExecCGI
        		AllowOverride All
			AddHandler php5-fastcgi .php
        		Action php5-fastcgi /fcgi-bin/$cgi_script
                        AllowOverride All
                        DirectoryIndex index.php index.html
                        Order allow,deny
                        Allow from all
                </Directory>
                ServerSignature Off
         </IfModule>"
fi


#create vhost config
echo "<VirtualHost *:80>
  ServerName $site_name
  DocumentRoot $doc_root
  $fcgi_config
</VirtualHost>" > "$site_name"

#enable new vhost
a2ensite "$site_name"

#add a entry to hosts file
echo "127.0.0.1 $site_name" >> /etc/hosts

#restart apache
service apache2 restart

