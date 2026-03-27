terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# EKS POC cluster
resource "aws_eks_cluster" "poc" {
  name     = var.app_name
  role_arn = aws_iam_role.cluster.arn
  version  = "1.28"

vpc_config {
    # Simplified POC - requires VPC setup
    subnet_ids = []
  }
  # Simplified

}

# Simplified - full VPC/IAM in production
resource "aws_iam_role" "cluster" {
  name = "${var.app_name}-cluster"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

# App deployment placeholder (use Helm/kubectl post-cluster)
resource "null_resource" "deploy_app" {
  provisioner "local-exec" {
    command = "kubectl apply -f ../../examples/python-app/k8s-test.yaml"
  }
  depends_on = [aws_eks_cluster.poc]
}
