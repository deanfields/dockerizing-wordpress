FROM php:5.6-apache

# The default PHP configuration is missing a few important extensions
# Install source packages to allow the extensions to be compiled
RUN apt-get update
RUN apt-get install -y libmcrypt-dev libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libcurl4-gnutls-dev libssl-dev libicu-dev vim

# Configure gd and intl extensions with any options you need
RUN docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir --with-png-dir
RUN docker-php-ext-configure intl

# Install the extensions
RUN docker-php-ext-install mysql mysqli pdo pdo_mysql mcrypt gd intl

# Install xdebug
RUN yes | pecl install xdebug

# Enable mod_rewrite
RUN a2enmod rewrite

VOLUME /var/www/html
