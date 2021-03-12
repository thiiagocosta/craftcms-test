FROM php:8.0.3-apache

ENV APACHE_DOCUMENT_ROOT /path/to/new/root

#PHP
RUN apt-get update -y && apt-get install -y libpng-dev curl libcurl4-openssl-dev
RUN docker-php-ext-install pdo pdo_mysql gd curl
RUN docker-php-ext-install mysqli

#PHP Install zip
RUN apt-get update && \
     apt-get install -y \
         libzip-dev \
         && docker-php-ext-install zip

#Apache
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80
CMD ["apache2-foreground"]