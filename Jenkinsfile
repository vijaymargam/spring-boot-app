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
      withDockerRegistry(credentialsId: 'ecr:ap-south-1:AWS_vijay', url: 'http://358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplcation') {
    //docker.build('358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication:latest')
        
        buildImage name: 'spring:latest', path: '.'
        tagImage name: 'spring:latest', tag: '358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplcation'
}
    }
    }
   stage('publish docker image to ecr') {
      steps {
      withDockerRegistry(credentialsId: 'ecr:ap-south-1:AWS_vijay', url: 'http://358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplcation') {
   // docker.image('358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplication:latest').push(latest)
        pushImage name: '358537675364.dkr.ecr.ap-south-1.amazonaws.com/springbootapplcation', tag: 'latest'
    }
    }
   }
  }
}
