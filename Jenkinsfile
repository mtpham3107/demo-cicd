pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'make build'
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