FROM wordpress

# apt-get update && apt-get install -y ssl-cert = Update package lists and install ssl-cert package
# a2enmod ssl = Enable the SSL module
# a2ensite default-ssl = Enable the default SSL site
# rm -rf /var/lib/apt/lists/* = Clean up apt cache to reduce image size
RUN apt-get update && apt-get install -y ssl-cert \
    && a2enmod ssl \
    && a2ensite default-ssl \ 
    && rm -rf /var/lib/apt/lists/* 


# Set the working directory inside the container
WORKDIR /var/www/html
