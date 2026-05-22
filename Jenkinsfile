pipeline {

    agent any

    triggers {
        pollSCM('* * * * *')
    }

    tools {
        nodejs 'NodeJS 20'
    }

    stages {

        stage('Pull Latest Code') {
            steps {

                echo 'New Commit Detected From GitHub Repository'

                git branch: 'main',
                url: 'https://github.com/trupalgorasiya/React-app-CI-CD.git'
            }
        }

        stage('Install Dependencies') {
            steps {

                echo 'Installing Node Modules'

                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {

                echo 'Running React Application Tests'

                sh 'npm test -- --watchAll=false --passWithNoTests'
            }
        }

        stage('Build React Application') {
            steps {

                echo 'Creating Production Build'

                sh 'npm run build'
            }
        }

        stage('Deployment Ready') {
            steps {

                echo 'Application Build Ready For Deployment'
            }
        }
    }

    post {

        success {

            echo 'CI/CD Pipeline Executed Successfully'
        }

        failure {

            echo 'Pipeline Execution Failed'
        }

        always {

            echo 'Pipeline Finished'
        }
    }
}