# Root - selects cloud module

module "app_deployment" {
  source = "./modules/app-deployment"
  
  cloud_provider = var.cloud_provider
  deployment_type = var.deployment_type
  app_name = var.app_name
  app_image = var.app_image
  replicas = var.replicas
  namespace = var.namespace
}

module "monitoring" {
  source = "./modules/monitoring"
  
  cloud_provider = var.cloud_provider
  cluster_name = var.cluster_name
}

module "secrets" {
  source = "./modules/secrets"
  
  cloud_provider = var.cloud_provider
  secret_name = "app-secret"
  secret_value = var.app_secret
}

module "dependencies" {
  source = "./modules/dependencies"
  
  cloud_provider = var.cloud_provider
  deps_enabled = var.deps_enabled
}

# Cloud-specific infra via count/for_each (init-time known)
module "aws_infra" {
  count  = var.cloud_provider == "aws" ? 1 : 0
  source = "./aws"
  
  region = var.region
}

module "gcp_infra" {
  count  = var.cloud_provider == "gcp" ? 1 : 0
  source = "./gcp"
  
  project_id = var.project_id
  region = var.region
}

module "azure_infra" {
  count  = var.cloud_provider == "azure" ? 1 : 0
  source = "./azure"
  
  resource_group_name = var.resource_group_name
  location = var.location
}
