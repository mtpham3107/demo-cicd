pipeline {
    agent any

     stages {
        stage('Checkout') {
            steps {
                // Checkout the source code
                git 'https://github.com/your-repo.git'
            }
        }
        stage('Build') {
            steps {
                // Example build step, replace with your actual build command
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                // Example test step, replace with your actual test command
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                // Example deploy step, replace with your actual deploy command
                sh 'make deploy'
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