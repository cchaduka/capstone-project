Udacity DevOps Nano Degree Program - Capstone Project

Setting up a CI/CD Pipeline and a Rolling Deployment using AWS EKS, Jenkins, CloudFormation, eksctl, Github and Docker

This project was done with guidance from the following resources:

https://medium.com/@Thegaijin/ci-cd-with-jenkins-docker-and-kubernetes-26932c3a1ea
https://medium.com/@andresaaap/jenkins-pipeline-for-blue-green-deployment-using-aws-eks-kubernetes-docker-7e5d6a401021

The Web App was adapted from a template found at https://templatemo.com/tm-530-mini-profile

1. Setup Access and Secret key pair in AWS IAM
2. Launch an EC2 instance
3. Install Jenkins
4. Install the necessary plugins, esp. Blue Ocean and AWS related ones
5. Install aws CLI 2
6. Configure the Access and Secret keypair in aws CLI
6. Install Docker
7. Pull the hadolint docker image
8. Configure AWS and Docker Hub access in Jenkins
9. Deploy CloudFormation Stack(s) using eksctl

    run the scripts/k8s-deploy.sh script

10. Setup the web application (this is in the webapp directory)
11. Create the Jenkinsfile for the CI/CD pipeline
12. Create the Dockerfile
13. Create the necessary deployment and service YAML scripts
14. Create the github repository to host the web app (and the project files)
15. Push your repo files to github, and let the magic happen

Take note of changes that don't reflect when you deploy your newly updated image. The Fix: https://stackoverflow.com/questions/40366192/kubernetes-how-to-make-deployment-to-update-image
