pipeline {
  agent any
  tools { 
        maven 'maven'
  }
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
      withSonarQubeEnv('sonarqube') {
    sh 'mvn clean test sonar:sonar package'
}
      // sh 'mvn -B -DskipTests clean package'
             }
    }
    stage('CreateInstance') {
      steps {
        node('Ansible'){
         checkout scm
         ansiblePlaybook playbook: '$WORKSPACE/createInstance.yaml'
      }
      }}
    stage('DeployArtifact') {
      steps {
        node('Ansible'){
          withMaven(maven: 'maven') {
          sh 'mvn clean package -DskipTests'
          }
       ansiblePlaybook become: true, colorized: true, credentialsId: 'windows', disableHostKeyChecking: true, inventory: '/tmp/hosts_dev', playbook: 'deployArtifact.yaml'
        
        }}
   }

  }
}
