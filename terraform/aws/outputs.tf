output "aws_eks_cluster_poc_endpoint" {
  value = aws_eks_cluster.poc.endpoint
}

output "cluster_name" {
  value = aws_eks_cluster.poc.name
}

