Udacity DevOps Nano Degree Program - Capstone Project

Setting up a CI/CD Pipeline and a Rolling Deployment using AWS EKS, Jenkins, CloudFormation, eksctl, Github and Docker

This project was done with guidance from the following resources:

https://medium.com/@Thegaijin/ci-cd-with-jenkins-docker-and-kubernetes-26932c3a1ea
https://medium.com/@andresaaap/jenkins-pipeline-for-blue-green-deployment-using-aws-eks-kubernetes-docker-7e5d6a401021

1. Launch an EC2 instance
2. Install Jenkins
3. Install the necessary plugins, esp. Blue Ocean and AWS related ones
4. Install aws CLI 2
5. Install Docker
6. Pull the hadolint docker image
7. Configure AWS and Docker Hub access in Jenkins
8. Deploy CloudFormation Stack(s) using eksctl
    eksctl create cluster --name=capstonecluster --version=1.17 --nodegroup-name=capstonenodegroup --node-type=t2.medium --nodes=3 --nodes-min=1 --nodes-max=4 --node-ami=auto --region=us-west-2
9. Setup the web application (this is in the webapp directory)
10. Create the Jenkinsfile for the CI/CD pipeline
11. Create the Dockerfile
12. Create the necessary deployment and service YAML scripts
13. Create the github repository to host the web app (and the project files)
14. Push your repo files to github, and let the magic happen

Take not of changes that don't reflect when you deploy your new image. The Fix: https://stackoverflow.com/questions/40366192/kubernetes-how-to-make-deployment-to-update-image
