pipeline {
    agent any
    stages {
        stage('Lancement des Tests Applicatifs') {
            agent {
                docker { 
                    image 'python:3.10-slim' 
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                echo 'Exécution des tests dans le conteneur Python...'
                sh 'python --version'
            }
        }
        
        stage('Build Image Water') {
            steps {
                echo 'Construction de l\'image Docker pour l\'application Water...'
                sh 'docker build -t water:latest .'
            }
        }
    }
}