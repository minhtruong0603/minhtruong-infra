# Variables cho module networking
aws_region           = "ap-northeast-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones   = ["ap-northeast-1a", "ap-northeast-1c"]

# Variables cho module ecr
repository_name      = "minhtruong-ecr-repo"
tags                 = { "Environment" = "dev", "Owner" = "minhtruong" }

# Variables cho module iam
eks_cluster_role_name = "minhtruong-eks-cluster-role"
eks_worker_node_role  = "minhtruong-eks-worker-role"

# Variables cho module eks
cluster_name          = "minhtruong-eks-cluster-dev"
kubernetes_version    = "1.31"
eks_sg                = "minhtruong-eks-sg"
eks_node_group_name   = "minhtruong-eks-node-group"
ami_type              = "AL2_x86_64"
instance_types        = "t3.medium"  # Dùng string vì variables.tf trong eks yêu cầu string
min_size              = 1
desired_size          = 2
max_size              = 2