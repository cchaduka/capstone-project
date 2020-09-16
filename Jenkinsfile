pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e ./webapp/index.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t eks-capstone-app .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "jenkins-dockerhub-access-capstone"]) {
                      sh "docker tag eks-capstone-app cchaduka/eks-capstone-app"
                      sh 'docker push cchaduka/eks-capstone-app'
                  }
              }
         }
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'aws-jenkins-access-capstone', region: 'us-west-2') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name capstonecluster"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:122942361001:cluster/capstonecluster"
                      sh "kubectl set image cchaduka/eks-capstone-app eks-capstone-app=cchaduka/eks-capstone-app:latest"
                      sh "kubectl apply -f deployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/eks-capstone-app"
                  }
              }
        }
        stage("Cleaning up") {
              steps{
                    echo 'Cleaning up...'
                    sh "docker system prune"
              }
        }
     }
}
