#!/bin/bash

# Set the image names
IMAGE_APP=go-todo-app
IMAGE_DB=go-todo-db

# Get the Docker Hub username and password from the command line arguments
USERNAME=$1
PASSWORD=$2

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin

# Tag the app image
echo "Tagging app image..."
docker tag $IMAGE_APP $USERNAME/$IMAGE_APP

# Tag the database image
echo "Tagging database image..."
docker tag $IMAGE_DB $USERNAME/$IMAGE_DB

# Push the app image to Docker Hub
echo "Pushing app image to Docker Hub..."
docker push $USERNAME/$IMAGE_APP

# Push the database image to Docker Hub
echo "Pushing database image to Docker Hub..."
docker push $USERNAME/$IMAGE_DB

# Log out of Docker Hub
echo "Logging out of Docker Hub..."
docker logout
