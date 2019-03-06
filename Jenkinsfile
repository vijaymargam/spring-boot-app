pipeline {
  agent any
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
      steps {
        checkout scm
      }
    }
    stage('Build docker image') {
      steps {
      withDockerRegistry(credentialsId: 'ecr:ap-south-1:AWS_vijay', url: '358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication') {
    def custContainer = docker.build('358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication:${env.BUILD_ID}')
    custContainer.push()
    custContainer.push(latest)
}
    }
    }
  
    }
    }
