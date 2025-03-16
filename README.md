# Mock Project - Infrastructure as Code (IaC) with Terraform and CI/CD

## Overview
This project demonstrates how to use Terraform for Infrastructure as Code (IaC) to deploy AWS EKS clusters and microservices with CI/CD using Jenkins.

## Prerequisites
- AWS Account
- Terraform installed
- Jenkins installed
- Docker installed
- AWS CLI configured

## Directory Structure
- `environments/`: Configuration for dev and prod environments.
- `modules/`: Terraform modules for networking, ecr, eks, iam.
- `cicd/`: Jenkins pipeline files.
- `global/`: Global backend configuration.

## Setup
1. Configure AWS CLI: `aws configure`
2. Initialize Terraform: `terraform init`
3. Apply Terraform: `terraform apply`
4. Run Jenkins pipeline to deploy microservices.

## Modules
- `networking`: Creates VPC, subnets, gateways.
- `ecr`: Creates ECR repository.
- `eks`: Deploys EKS cluster and node groups.
- `iam`: Configures IAM roles and policies.

## CI/CD
- Use `Jenkinsfile` to automate deployment.
- Use `Jenkinsfile-destroy` to clean up resources.# minhtruong-infra
