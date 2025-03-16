variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_role_name" {
  description = "Name of IAM role for EKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version of EKS cluster"
  type        = string
}

variable "eks_sg" {
  description = "Name of security group for EKS cluster"
  type        = string
}

variable "eks_node_group_name" {
  description = "EKS node group name"
  type        = string
}

variable "ami_type" {
  description = "AMI type for EKS node group"
  type        = string
}

variable "instance_types" {
  description = "Instance types for EKS node group"
  type        = string
}

variable "min_size" {
  description = "Min node in EKS node group"
  type        = number
}

variable "desired_size" {
  description = "node desire of EKS node group"
  type        = number
}

variable "max_size" {
  description = "Max node in EKS node group"
  type        = number
}

variable "tags" {
  description = "The tags"
  type        = map(string)
}

variable "eks_worker_node_role" {
  description = "EKS worker node role name"
  type = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  
}

# variable "region" {
#   description = "AWS region to deploy resources"
#   default     = "ap-northeast-1"
# }

# variable "ami_id" {
#   description = "AMI ID for EKS nodes"
#   default     = "ami-0599b6e53ca798bb2"
# }

# variable "instance_type" {
#   description = "Instance type for EKS nodes"
#   default     = "t3.medium"
# }

# variable "key_name" {
#   description = "SSH key pair name"
#   default     = "minhtruong-key"
# }