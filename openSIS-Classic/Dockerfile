# Use an official PHP image with Apache
FROM php:8.1-apache

# Install dependencies (optional if you need specific extensions)
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy your application files to the container
COPY . /var/www/html/

# Set the correct file permissions
RUN chown -R www-data:www-data /var/www/html

# Expose the port Apache will run on
EXPOSE 80

# Command to run Apache in the foreground
CMD ["apache2-foreground"]