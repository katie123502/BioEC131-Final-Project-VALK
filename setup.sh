#!/bin/bash

# Variables
DOCKER_IMAGE="herpes-jbrowse"  # Custom Docker image name
DOCKERFILE_PATH="." 
DATA_URL="herpes-genomes" # Replace with your dataset URL
DATA_DIR="my-jbrowse-data"
CONTAINER_NAME="jbrowse"

# Functions

check_docker_installed() {
  if ! command -v docker &>/dev/null; then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
  fi
}

download_dataset() {
  echo "Downloading dataset..."
  if [ ! -d "$DATA_DIR" ]; then
    mkdir -p "$DATA_DIR"
  fi
#   IF DOWNLOADING ZIP FILE OF DATA OFF THE INTERNET
#   curl -L "$DATA_URL" -o dataset.zip
#   echo "Extracting dataset..."
#   unzip -o dataset.zip -d "$DATA_DIR"
#   rm dataset.zip
    cp -r $DATA_URL my-jbrowse-data
}

build_docker_image() {
  echo "Building the custom Docker image..."
  docker build -t $DOCKER_IMAGE $DOCKERFILE_PATH
}

run_docker_container() {
  echo "Running the Docker container..."
  docker run -d \
    --name $CONTAINER_NAME \
    -p 8080:8080 \
    -v $(pwd)/$DATA_DIR:/jbrowse/data \
    $DOCKER_IMAGE

  echo "JBrowse2 is running at http://localhost:8080"
}

cleanup_existing_container() {
  if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
  fi
}

# Main Script Execution
echo "Starting JBrowse2 setup..."

# Check if Docker is installed
check_docker_installed

# Download and prepare dataset
download_dataset

# Stop and remove any existing JBrowse container
cleanup_existing_container

# Build the custom Docker image
build_docker_image

# Run the JBrowse Docker container
run_docker_container

echo "Setup complete!"
