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

# Cluster/Infrastructure (EKS for k8s, EC2 for vm, etc.)
module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"  # External module placeholder
  count  = var.deployment_type == "k8s" ? 1 : 0
  cluster_name = var.app_name
  cluster_version = "1.28"
  # Subnets/VPC vars from root
}

# App
module "app" {
  source = "../../modules/app-deployment"
  app_name = var.app_name
  app_image = var.app_image
  deployment_type = var.deployment_type
  cloud_provider = var.cloud_provider
}

# Monitoring
module "monitoring" {
  source = "../../modules/monitoring"
  cloud_provider = var.cloud_provider
  cluster_name = var.app_name
}

# Secrets
module "secrets" {
  source = "../../modules/secrets"
  cloud_provider = var.cloud_provider
  secret_name = "${var.app_name}-db-pass"
  secret_value = "supersecret"  # From secrets or generate
}

# Deps
module "deps" {
  source = "../../modules/dependencies"
  cloud_provider = var.cloud_provider
}
