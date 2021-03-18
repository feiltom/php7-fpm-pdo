FROM php:7.0-fpm
RUN apt-get update &&\
    apt-get install -y libpq-dev libcurl4-openssl-dev zlib1g-dev libzip-dev libpng-dev libmcrypt-dev libbz2-dev libxml2-dev libonig-dev libicu-dev &&\
    docker-php-ext-install pdo mcrypt pdo_mysql pdo_pgsql curl json gd opcache bz2 mbstring intl xml zip &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean
