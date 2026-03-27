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

# Select cloud (manual/comment)
module "aws_cluster" {
  source = "./aws"

  region = var.region
  app_name = var.app_name
  cluster_name = var.cluster_name
  cloud_provider = "aws"
  deployment_type = var.deployment_type
  app_image = var.app_image
  for_each = var.cloud_provider == "aws" ? toset(["aws"]) : toset([])
}

module "gcp_cluster" {
  source = "./gcp"

  region = var.region
  app_name = var.app_name
  project_id = var.project_id
  cluster_name = var.cluster_name
  for_each = var.cloud_provider == "gcp" ? toset(["gcp"]) : toset([])
}

module "azure_cluster" {
  source = "./azure"

  location = var.location
  resource_group_name = var.resource_group_name
  cluster_name = var.cluster_name
  app_name = var.app_name
  for_each = var.cloud_provider == "azure" ? toset(["azure"]) : toset([])
}


