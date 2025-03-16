pipeline {
    agent any
    environment {
        AWS_REGION = 'ap-northeast-1'
        ECR_REPO = 'minhtruong-ecr'
        TF_VAR_repository_name = 'minhtruong-ecr'
        TF_VAR_cluster_name = 'minhtruong-eks'
        TF_VAR_eks_cluster_role_name = 'minhtruong-eks-cluster-role'
        TF_VAR_kubernetes_version = '1.24'
        TF_VAR_eks_sg = 'minhtruong-eks-sg'
        TF_VAR_eks_node_group_name = 'minhtruong-eks-node-group'
        TF_VAR_ami_type = 'AL2_x86_64'
        TF_VAR_instance_types = 't3.medium'
        TF_VAR_min_size = 2
        TF_VAR_desired_size = 2
        TF_VAR_max_size = 3
        TF_VAR_eks_worker_node_role = 'minhtruong-eks-worker-role'
        TF_VAR_vpc_cidr = '10.0.0.0/16'
        TF_VAR_public_subnet_cidrs = ['10.0.1.0/24', '10.0.2.0/24']
        TF_VAR_private_subnet_cidrs = ['10.0.3.0/24', '10.0.4.0/24']
        TF_VAR_availability_zones = ['ap-northeast-1a', 'ap-northeast-1c']
        TF_VAR_tags = '{"Environment": "dev"}'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Zudypubg/mock-project', branch: 'main'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init -backend-config="bucket=minhtruong-terraform-state" -backend-config="key=dev/terraform.tfstate" -backend-config="region=ap-northeast-1" -backend-config="dynamodb_table=terraform-lock"'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=environments/dev/variables.tf -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
        stage('Build and Push Docker Images') {
            steps {
                dir('web-service') {
                    sh 'docker build -t $ECR_REPO/web-service:latest .'
                    sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_REGION.amazon.com/$ECR_REPO'
                    sh 'docker tag $ECR_REPO/web-service:latest $AWS_REGION.amazon.com/$ECR_REPO/web-service:latest'
                    sh 'docker push $AWS_REGION.amazon.com/$ECR_REPO/web-service:latest'
                }
                // Tương tự cho api-service, worker-service, monitor-service
            }
        }
        stage('Deploy to EKS') {
            steps {
                sh 'kubectl apply -f k8s-deployment/'
            }
        }
    }
    post {
        always {
            sh 'terraform output'
            cleanWs()
        }
    }
}