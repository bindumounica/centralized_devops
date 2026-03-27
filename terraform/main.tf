# Root config - calls shared modules + cloud infra

module "shared_app" {
  source = "./modules/app-deployment"
  
  cloud_provider = var.cloud_provider
  deployment_type = var.deployment_type
  app_name = var.app_name
  app_image = var.app_image
  replicas = var.replicas
  namespace = var.namespace
}

module "shared_monitoring" {
  source = "./modules/monitoring"
  
  cloud_provider = var.cloud_provider
  cluster_name = var.cluster_name
}

module "shared_secrets" {
  source = "./modules/secrets"
  
  cloud_provider = var.cloud_provider
  secret_name = "${var.app_name}-secret"
  secret_value = var.app_secret
}

module "shared_deps" {
  source = "./modules/dependencies"
  
  cloud_provider = var.cloud_provider
  deps_enabled = var.deps_enabled
}

# Cloud infra (select one dir/script)
# cd terraform/aws && terraform init/apply for AWS POC
# AWS POC infra
module "aws_cluster" {
  source = "./aws"
  
  region = var.region
  app_name = var.app_name
  deployment_type = var.deployment_type
  app_image = var.app_image
  cloud_provider = "aws"
  cluster_name = var.cluster_name
}

# Outputs
output "app_endpoint" {
  value = module.shared_app.app_endpoint
}
