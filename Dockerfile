# Use the official PHP image
FROM php:8.0-cli

# Set the working directory in the container
WORKDIR /app

# Copy all files from the repo to the container
COPY . .

# Install any necessary PHP extensions or dependencies (e.g., for composer, etc.)
RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip

# Expose the port (Render expects a port like 10000)
EXPOSE 10000

# Start PHP built-in server pointing to the 'src' directory
CMD ["php", "-S", "0.0.0.0:10000", "-t", "/app/src"]
