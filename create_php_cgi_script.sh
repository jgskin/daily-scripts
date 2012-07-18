#! /bin/bash

#php cgi script
php_cgi=$1

#script for apache suexec
script_name=$2

#fcgi-bin dir
cgi_dir="/var/www/cgi-bin"

if [ ! -d "$cgi_dir" ]; then
    #create dir
    mkdir "$cgi_dir"
fi

groupadd web
useradd -g web -d /var/www/cgi-bin web

#script full name
fullname="$cgi_dir/$script_name"

#create the script
echo "#! /bin/bash
exec $php_cgi" > "$fullname"

#fix script and dir permissions
chmod -R 755 "$cgi_dir"
chown -R web:web "$cgi_dir"