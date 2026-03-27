# Simplified POC outputs
output "cluster_name" {
  value = aws_eks_cluster.poc.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.poc.endpoint
}

