pipeline {
  agent any
  environment {
     TEST="test"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker images') {
      steps {
        sh 'docker-compose build'
      }
    }
    stage('Deploy') {
      steps {
        script {
          sh 'ssh kryzhalka@example.com "docker-compose pull && docker-compose up -d"'
        }
      }
    }
  }
}
