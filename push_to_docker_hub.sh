#!/bin/bash

# Set the image name
IMAGE=go-todo-app

# Get the Docker Hub username and password from the command line arguments
USERNAME=$1
PASSWORD=$2

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin

# Tag the image
echo "Tagging app image..."
docker tag $IMAGE $USERNAME/$IMAGE

# Push the app image to Docker Hub
echo "Pushing app image to Docker Hub..."
docker push $USERNAME/$IMAGE

# Log out of Docker Hub
echo "Logging out of Docker Hub..."
docker logout
