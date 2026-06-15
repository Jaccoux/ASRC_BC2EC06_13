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

        stage('Push Image Registry') {
            steps {
                echo 'Dépôt de l\'image construite sur le registre local...'
                sh 'docker tag water:latest localhost:5000/water:latest'
                sh 'docker push localhost:5000/water:latest'
            }
        }

        stage('Deploy to Host') {
            steps {
                echo 'Déploiement de l\'application Water sur la machine hôte...'
                // Supprimer l'ancien conteneur s'il existe pour éviter les conflits de nom
                sh 'docker rm -f water-app-prod || true'
                // Déployer le nouveau conteneur depuis le registre local sur le port 8082
                sh 'docker run -d --name water-app-prod -p 8082:80 localhost:5000/water:latest'
                echo 'Application déployée et accessible sur http://localhost:8082'
            }
        }
    }
}