##### This repository contains the files and scripts to deploy the 'todo' app to Kubernetes.

## Components:

* `Dockerfile` - This file will create a Docker image with all the necessary packages to run the app using Golang

* `push_to_docker_hub.sh` - a script to push the 'app' image to Docker Hub.

* `add_hosts_entry.sh` - a script to update `/etc/hosts` with the relevant domain name for the app to be accessible from.

* Helm charts which will deploy the application to Kubernetes and the database.

* CircleCI config file - The contents of `.circleci` will be used to create a CI/CD pipeline which will perform all steps to deploy the app.

## CI/CD Flow:

1. Build the `Dockerfile` and create the 'app' image.
2. Push the images to Docker Hub using `push_to_docker_hub.sh`.
3. Deploy the helm charts for 'app' and 'db' to Kubernetes, the base image for the app will be the image pushed to Docker Hub in the previous stage and the database image is `mysql:8.0`.
    The charts will create a Kubernetes Deployment for the app and a StatefulSet for the databse.
    ** Need to add more details about the spec **
4. Run the script to add the hosts entry.