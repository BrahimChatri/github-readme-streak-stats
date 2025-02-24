# Use the official PHP image
FROM php:8.0-cli

# Set the working directory in the container
WORKDIR /app

# Copy the composer.json and composer.lock first to install dependencies
COPY composer.json composer.lock ./

# Install Composer (PHP dependency manager)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP dependencies via Composer
RUN composer install --no-interaction

# Copy the rest of the application code
COPY . .

# Set the command to run your PHP application
CMD ["php", "/app/src/index.php"]
