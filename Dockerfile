# Use official PHP image from Docker Hub
FROM php:8.0-cli

# Set working directory inside the container
WORKDIR /app

# Copy the repository files into the container
COPY . .

# Expose the port that the app will be served on
EXPOSE 10000

# Run PHP built-in server
CMD ["php", "-S", "0.0.0.0:10000"]
