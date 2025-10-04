pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['plan', 'apply', 'destroy'], description: 'Terraform action')
    }

    triggers {
        githubPush()  // webhook trigger
    }

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/senjaliyadhruv/Jenkins-Terraform-GIt.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan/Apply/Destroy') {
            steps {
                script {
                    if (params.ACTION == "plan") {
                        sh 'terraform plan -input=false'
                    } else if (params.ACTION == "apply") {
                        sh 'terraform apply -auto-approve -input=false'
                    } else if (params.ACTION == "destroy") {
                        sh 'terraform destroy -auto-approve -input=false'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform ${params.ACTION} completed successfully!!"
        }
        failure {
            echo "❌ Terraform ${params.ACTION} failed."
        }
        always {
            echo "Pipeline finished. Cleaning up workspace..."
            deleteDir()
        }
    }
}
