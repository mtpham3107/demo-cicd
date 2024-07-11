pipeline {
    agent any
     environment {
            BUILD_CONFIGURATION = "Release"
     }
     stages {
        stage('Build') {
            sh "dotnet build -c ${BUILD_CONFIGURATION}"
        }
        stage('Push') {}
        stage('Clean') {}
        stage('Run') {}
     }
     post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}