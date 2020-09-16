#!/bin/bash

docker_image_name="eks-capstone-app"
dockerhub_username=cchaduka
docker_image_tag=latest

# Make sure you have logged in to docker hub
# see the docker login command

# Once that's done, tag and push the image
docker tag `docker images | grep ${docker_image_name} | awk '{print $3}' | head -n 1` ${dockerhub_username}/${docker_image_name}:${docker_image_tag}

docker push ${dockerhub_username}/${docker_image_name}
