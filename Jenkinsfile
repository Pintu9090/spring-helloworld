pipeline {
    agent any
    
    environment {
        DOCKER_REPO = "https://hub.docker.com/repository/docker/pintu9090/pintu_repo"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Pintu9090/spring-helloworld'
            }
        }
        
        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    docker.build("${DOCKER_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("${DOCKER_REPO}:${env.BUILD_NUMBER}").push()
                        docker.image("${DOCKER_REPO}:${env.BUILD_NUMBER}").push("latest")
                    }
                }
            }
        }
        
        stage('Run Docker') {
            steps {
                sh "docker run -d -p 8080:8080 ${DOCKER_REPO}:${env.BUILD_NUMBER}"
            }
        }
    }
}
