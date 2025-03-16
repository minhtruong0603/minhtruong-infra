data "aws_vpc" "existing" {
  id = var.vpc_id
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = var.eks_sg
  vpc_id      = var.vpc_id
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Cho phép ingress cho microservices
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # tags = var.tags
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = var.eks_cluster_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_name_arm
  version     = var.kubernetes_version
  
  vpc_config {
    subnet_ids = var.public_subnet_ids 
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

resource "aws_eks_node_group" "eks_nodes" {
  # cluster_name    = var.cluster_name
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.eks_node_group_name
  node_role_arn   = var.eks_node_role_arn 
  ami_type        = var.ami_type
  instance_types  = [var.instance_types]
  # instance_types = ["t3.large"]
  subnet_ids = var.public_subnet_ids 

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  depends_on = [aws_eks_cluster.eks]
}