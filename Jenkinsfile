pipeline {
    agent any

    tools {
        dockerTool 'Dockertool'
    }

    stages {
        stage('Ejecutar Tests') {
            steps {
                sh 'docker run --rm -v "$WORKSPACE":/app -w /app node:22-alpine sh -c "npm ci && npm test"'
            }
        }

        stage('Construir Imagen Docker') {
            steps {
                sh 'docker build -t hola-mundo-node:latest .'
            }
        }

        stage('Ejecutar Contenedor Node.js') {
            steps {
                sh '''
                    docker stop hola-mundo-node || true
                    docker rm hola-mundo-node || true
                    docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                '''
            }
        }
    }
}