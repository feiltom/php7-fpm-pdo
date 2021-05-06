FROM php:7.0-fpm
RUN apt-get update &&\
    apt-get install -y fontconfig fontconfig-config fonts-dejavu-core libexpat1 libfontconfig1 libfontenc1 libfreetype6 libjpeg62-turbo libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxext6 libxfont1 libxrender1 ucf x11-common xfonts-75dpi xfonts-base xfonts-encodings xfonts-utils wget libpq-dev libcurl4-openssl-dev zlib1g-dev libzip-dev libpng-dev libmcrypt-dev libbz2-dev libxml2-dev libonig-dev libicu-dev &&\
    docker-php-ext-install pdo mcrypt pdo_mysql pdo_pgsql curl json gd opcache bz2 mbstring intl xml zip &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && rm -rf  
