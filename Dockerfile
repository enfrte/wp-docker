FROM wordpress

# It's weird because running as root is running as your user
USER root

# enable apache module rewrite
RUN a2enmod rewrite

# enable ssl module with fake certificate
RUN apt-get update && apt-get install -y ssl-cert \
    && a2enmod ssl \
    && a2ensite default-ssl \
    && rm -rf /var/lib/apt/lists/*


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

#RUN docker-php-ext-enable xdebug

COPY ./php.ini /usr/local/etc/php/

# Set working directory - Is this needed?
WORKDIR /var/www/html
