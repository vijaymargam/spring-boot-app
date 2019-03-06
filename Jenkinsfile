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
    docker.build('358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication:latesh')
}
    }
    }
   stage('publish docker image to ecr') {
      steps {
      withDockerRegistry(credentialsId: 'ecr:ap-south-1:AWS_vijay', url: '358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication') {
    docker.image('358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication:latesh').push(latest)
}
    }
    }
     
  }
}
