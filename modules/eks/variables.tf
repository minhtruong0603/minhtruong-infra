variable "cluster_name" {
  description = "The EKS cluster name"
  type        = string
}

variable "eks_cluster_role_name" {
  description = "The EKS cluster IAM role name"
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

# variable "tags" {
#   description = "The tags"
#   type        = map(string)
# }

variable "eks_worker_node_role" {
  description = "EKS worker node role name"
  type = string
}

variable "ingress_cidr_blocks" {
  description = "Local IP"
  type = string
}

variable "eks_cluster_role_name_arm" {
  description = "IAM role eks cluster node"
  type = string
}

variable "public_subnet_ids" {
  description = "EKS subnet get from vpc"
  type = any
}

variable "eks_node_role_arn" {
  description = "IAM role eks worker node"
  type = string
}

variable "vpc_id" {
  description = "vpc id"
  type = string
}