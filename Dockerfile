FROM php:7.0-fpm
RUN apt-get update &&\
    apt-get install -y libpq-dev libcurl4-openssl-dev zlib1g-dev libzip-dev libpng-dev libmcrypt-dev libbz2-dev libxml2-dev libonig-dev libicu-dev &&\
    docker-php-ext-install pdo pdo_mysql pdo_pgsql curl json gd opcache bz2 mbstring intl xml zip &&\
    #pecl install mcrypt-1.0.1 && \
    #docker-php-ext-enable mcrypt &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean
RUN docker-php-ext-install mcrypt
    #
    #bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader xmlrpc xmlwriter xsl zend_test zip
    #