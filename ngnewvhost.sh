#!/usr/bin/env bash

echo "Creating directories ..."
	mkdir /var/www/$1/public
	mkdir /var/www/$1/logs

echo "Writing config file ..."
	echo "
server {
    listen   80;
    server_name $1 www.$1;
    access_log /var/www/$1/logs/access.log;
    error_log /var/www/$1/logs/error.log;

    location / {
        root   /var/www/$1/public;
        index  index.php index.html index.htm;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass  127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param  SCRIPT_FILENAME  /var/www/$1/public\$fastcgi_script_name;
    }
}
" >> /etc/nginx/sites-available/$i

echo "Enabling site and restarting nginx ..."
	ln -s /etc/nginx/sites-available/$i /etc/nginx/sites-enabled/$1
	/etc/init.d/nginx restart
