pipeline {
    agent any
    parameters {
        string(name: 'ACTION', defaultValue: 'apply', description: 'Terraform action: apply or destroy')
    }
    stages {
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/senjaliyadhruv/jenkins-project.git'
            }
        }
        stage('Terraform version') {
            steps {
                sh 'terraform --version'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform validate') {
            steps {
                    sh 'terraform validate'
            }
        }
        stage('Terraform plan') {
            steps {
                    sh 'terraform plan'
            }
        }
        stage('Terraform apply/destroy') {
            steps {
                    sh "terraform ${params.ACTION} -auto-approve"
            }
        }
    }
}

