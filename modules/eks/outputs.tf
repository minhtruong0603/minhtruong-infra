output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig" {
  value = aws_eks_cluster.eks.kubeconfig
}