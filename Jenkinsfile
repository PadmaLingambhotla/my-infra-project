pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('azure-service-principal')
    }

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/PadmaLingambhotla/my-infra-project.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                bat 'terraform init'
            }
        }
        stage('Validate Terraform') {
            steps {
                bat 'terraform validate'
            }
        }
        stage('Plan Terraform') {
            steps {
                bat 'terraform plan'
            }
        }
        stage('Apply Terraform') {
            steps {
                bat 'terraform apply -auto-approve'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
