pipeline {
    agent any

    environment {
        IMAGE_NAME = "springboot-app"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DeepikaCAshok/Employee-Management-Portal.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t springboot-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker-compose down --remove-orphans || true
                docker-compose up -d --build
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                sleep 10
                curl -f http://localhost:8083/employees
                '''
            }
        }
    }
}
