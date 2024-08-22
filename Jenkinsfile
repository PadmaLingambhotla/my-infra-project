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
                bat 'D:\\Software\\terraform_1.9.4_windows_amd64\\terraform.exe init'
            }
        }
        stage('Validate Terraform') {
            steps {
                bat 'D:\\Software\\terraform_1.9.4_windows_amd64\\terraform.exe validate'
            }
        }
        stage('Plan Terraform') {
            steps {
                bat 'D:\\Software\\terraform_1.9.4_windows_amd64\\terraform.exe plan'
            }
        }
        stage('Apply Terraform') {
            steps {
                bat 'D:\\Software\\terraform_1.9.4_windows_amd64\\terraform.exe apply -auto-approve'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
