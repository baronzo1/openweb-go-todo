##### This repository contains the files and script to deploy to 'todo' app to Kubernetes.

## Components:

* `Dockerfile` - This file will create a Docker image with all the necessary packages to run the app using Golang

* `docker-compose.yml` - This will create the Docker images for the 'todo' app and the MySQL database

* `create_docker_repos.sh` - a script to push the 'app' and 'db' images to Docker Hub.

* `add_hosts_entry.sh` - a script to update `/etc/hosts` with the relevant domain name for the app to be accessible from.

* Helm charts which will use the images from Docker Hub to deploy the application to Kubernetes.

* CircleCI config file - The contents of `.circleci` will be used to create a CI/CD pipeline which will perform all steps to deploy the app.

## CI/CD Flow:

1. Build the `docker-compose.yml` file and create the 'app' and 'db' images.
2. Push the images to Docker Hub using `create_docker_repos.sh`.
3. Deploy the helm charts for 'app' and 'db' to Kubernetes, using the images from Dockerhub.
4. Run the script to add the hosts entry.