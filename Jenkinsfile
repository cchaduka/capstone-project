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
		  echo '...==Check HTML syntax==...'
                  sh 'tidy -q -e ./webapp/index.html'
              }
         }
	 stage('Lint Dockerfile') {
	      steps {
		  echo '...==Lint Dockerfile before building==...'
		  sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
              }
	 }
         stage('Build Docker Image') {
              steps {
		  echo '...==Building Docker image for our app==...'
                  sh 'docker build -t eks-capstone-app .'
              }
         }
         stage('Push Docker Image') {
              steps {
		  echo '...==Push new docker image to Docker Hub==...'
                  withDockerRegistry([url: "", credentialsId: "jenkins-dockerhub-access-capstone"]) {
                      sh "docker tag eks-capstone-app cchaduka/eks-capstone-app"
                      sh 'docker push cchaduka/eks-capstone-app'
                  }
              }
         }
         stage('Deploying to EKS') {
              steps{
                  echo '...==Deploying to Amazon EKS==...'
                  withAWS(credentials: 'aws-jenkins-access-capstone', region: 'us-west-2') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name capstonecluster"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:122942361001:cluster/capstonecluster"
                      sh "kubectl set image deployment/eks-capstone-app eks-capstone-app=cchaduka/eks-capstone-app:latest"
                      sh "kubectl apply -f deployment/deployment-script.yml"
                      sh "kubectl apply -f deployment/load-balancer.yml"  
                      sh "kubectl rollout restart deployment/eks-capstone-app"                    
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/eks-capstone-app"
                  }
              }
        }
        stage("Cleaning up") {
              steps{
                    echo '...==Cleaning up local Docker system==...'
                    sh "chmod 755 ./scripts/system-cleanup.sh"
                    sh "./scripts/system-cleanup.sh"
              }
        }
     }
}
