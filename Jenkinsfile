pipeline {
    agent any

    environment {
        AZURE_CLIENT_ID = credentials('AZURE_CLIENT_ID')  
        AZURE_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')  
        AZURE_TENANT_ID = credentials('AZURE_TENANT_ID')  
        AZURE_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')  
    }

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/PadmaLingambhotla/my-infra-project.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                bat '"C:\\Windows\\System32\\cmd.exe" /c terraform init'
            }
        }
        stage('Validate Terraform') {
            steps {
                bat '"C:\\Windows\\System32\\cmd.exe" /c terraform validate'
            }
        }
        stage('Plan Terraform') {
            steps {
                bat '"C:\\Windows\\System32\\cmd.exe" /c terraform plan'
            }
        }
        stage('Apply Terraform') {
            steps {
                bat '"C:\\Windows\\System32\\cmd.exe" /c terraform apply -auto-approve'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
