#! /bin/bash

#how to use:
# download a php version of your choice (tested with php5.3 and php5.4)
# decompress the file and run the script
# use the --sub-php option to install a secondary version on your system
# eg: ./php_install.sh --sub-php /path/to/install (do not put a slash at the end of the string)

#opt parse
while [ "$1" != "" ]; do
    if [ $1 == "--sub-php" ]; then
        shift
        sub_php="$1"
    elif [ $1 == "--no-apxs" ]; then
        no_apxs=true
    fi
    shift
done

apt-get install apache2-threaded-dev
apt-get install libxml2-dev
apt-get install libicu-dev
apt-get install g++

if [ ! -d "$sub_php" ]; then

    #apxs default
    apxs_opt="--with-apxs2=/usr/bin/apxs2"

    if $no_apxs ; then
        #disable apxs
        apxs_opt=
    fi

    #install the main php version  
    ./configure "$apxs_opt" --with-mysql --enable-mbstring --enable-intl
else
    #install the sub php version
    ./configure --prefix="$sub_php" --with-mysql --with-libdir=lib/x86_64-linux-gnu --enable-mbstring --enable-intl
fi