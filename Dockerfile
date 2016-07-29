FROM alpine:latest
MAINTAINER John Miller <john@harleydigital.com>

# Get the packages
RUN apk add --no-cache \
        bash nginx ca-certificates unzip \
        php5-fpm php5-json php5-zlib php5-xml php5-gd php5-pdo php5-pdo_sqlite \
        php5-phar php5-openssl php5-zip php5-iconv php5-mcrypt musl \
        && rm -rf /var/cache/apk/*

# add the necessary files
ADD nginx.conf /etc/nginx
ADD php-fpm.conf /etc/php5
ADD run.sh /

# get the kanban install files
ADD https://kanboard.net/kanboard-1.0.31.zip /

# decompress install files
RUN unzip /kanboard-1.0.31.zip

# make the run script executable
RUN chmod +x /run.sh

# open the port
EXPOSE 80

# set the data volume
VOLUME ["/data/"]

# start
CMD ["/run.sh"]
