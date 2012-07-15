#! /bin/bash

#run on symfony 2 project root

username=$1
apache_user="www-data"

sudo setfacl -R -m u:"$apache_user":rwx -m u:"$username":rwx app/cache app/logs
sudo setfacl -dR -m u:"$apache_user":rwx -m u:"$username":rwx app/cache app/logs