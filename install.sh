#!/bin/bash

# Function to display error messages
error() {
    echo "Error: $1"
    exit 1
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if ! command_exists docker; then
    error "Docker is not installed. Please install Docker and try again."
fi

# Check if Docker Compose is installed
if ! command_exists docker-compose; then
    error "Docker Compose is not installed. Please install Docker Compose and try again."
fi

# Check if Composer is installed
if ! command_exists composer; then
    error "Composer is not installed. Please install Composer and try again."
fi

# Step 1: Clone the project
echo "Cloning the project..."
git clone https://github.com/SmailKou/poc-drupal.git || error "Failed to clone the project."

# Step 2: Set up Docker containers
echo "Setting up Docker containers..."
cd poc-drupal || error "Failed to navigate to project directory."
docker-compose up -d || error "Failed to set up Docker containers."

# Step 3: Install Composer dependencies
echo "Installing Composer dependencies..."
docker exec -T drupal composer install || error "Failed to install Composer dependencies."

# Step 4: Update Drupal database
#echo "Updating Drupal database..."
#docker exec -T drupal drush updb || error "Failed to update Drupal database."

# Step 5: Clear Drupal cache
echo "Clearing Drupal cache..."
docker exec -T drupal drush cr || error "Failed to clear Drupal cache."

# Step 6: Finish
echo "Installation completed successfully."
