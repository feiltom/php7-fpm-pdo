FROM php:7.0-fpm
RUN apt-get update &&\
    apt-get install -y libpq-dev libcurl4-openssl-dev zlib1g-dev libzip-dev libpng-dev libmcrypt-dev libbz2-dev libxml2-dev libonig-dev libicu-dev &&\
    docker-php-ext-install pdo mcrypt pdo_mysql pdo_pgsql curl json gd opcache bz2 mbstring intl xml zip &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean

RUN apk add --no-cache wkhtmltopdf
RUN wget https://github.com/aantonw/docker-alpine-wkhtmltopdf-patched-qt/releases/download/v0.12.5/wkhtmltopdf-0.2.5-bin.tar.gz && \
    mkdir /tmp/wkhtmltopdf && tar -xvf wkhtmltopdf-0.2.5-bin.tar.gz -C /tmp/wkhtmltopdf && \
    cp /tmp/wkhtmltopdf/bin/wkhtmltopdf /usr/bin/wkhtmltopdf && cp /tmp/wkhtmltopdf/bin/wkhtmltoimage /usr/bin/wkhtmltoimage && \
    cp /tmp/wkhtmltopdf/lib/libwkhtmltox.so.0.12.5 /usr/lib/libwkhtmltox.so.0.12.5 && \
    rm -rf wkhtmltopdf-0.2.5-bin.tar.gz && rm -rf /tmp/wkhtmltopdf
