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

        stage('Build Docker Image') {
            steps {

                echo 'Building Docker Image'
                sh 'docker build -t trupalgorasiya/react-cicd-app:latest .'
                sh 'docker build -t trupalgorasiya/react-cicd-app:${BUILD_NUMBER} .'
            }
        }

        stage('DockerHub Login') {

            steps {
                 withCredentials([
                    string(credentialsId: 'USER', variable: 'DOCKER_USER'),
                    string(credentialsId: 'PASS', variable: 'DOCKER_PASS')
                ]) {

                    sh '''
                    docker login -u $DOCKER_USER -p $DOCKER_PASS
                    '''
                }
            }
        }

        stage('Push Latest Image') {
            steps {
                
                echo 'push Latest image'

                sh 'docker push trupalgorasiya/react-cicd-app:latest'
            }
        }

        stage('Push Version Image') {
            steps {
                
                echo 'push version image'

                sh 'docker build -t trupalgorasiya/react-cicd-app:${BUILD_NUMBER} '
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