#!/bin/bash

docker_image_name="eks-capstone-app"

# Our Dockerfile is in the home directory
cd ~

# Build the docker image
docker build --tag ${docker_image_name} .

