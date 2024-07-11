pipeline {
    agent any

    environment {
            BUILD_CONFIGURATION = "Release"
     }

     stages {
        stage('Build') {
            steps {
                sh "dotnet build -c ${BUILD_CONFIGURATION}"
            }
        }
        stage('Test') {
            steps {
                echo 'make test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'make deploy'
            }
        }
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