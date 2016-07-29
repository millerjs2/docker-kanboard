#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh

if [ ! -d /data/htdocs ] ; then
  mkdir -p /data/htdocs
  chown nginx:www-data /data/htdocs
fi

# start php-fpm
mkdir -p /data/logs/php-fpm
php-fpm

# move the kanboard files into place
mv /kanboard-1.0.31/* /data/htdocs/

# start nginx
mkdir -p /data/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx
