variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

#################################

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