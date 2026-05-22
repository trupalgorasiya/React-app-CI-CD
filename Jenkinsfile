pipeline {

    agent any

    stages {

        stage('Welcome') {
            steps {

                echo 'Hello from Jenkins Pipeline'
            }
        }

        stage('Build') {
            steps {

                echo 'Building Application'
            }
        }

        stage('Test') {
            steps {

                echo 'Running Tests'
            }
        }

        stage('Deploy') {
            steps {

                echo 'Deploying Application'
            }
        }
    }

    post {

        success {
            echo 'Pipeline Successful'
        }

        failure {
            echo 'Pipeline Failed'
        }
    }
}
