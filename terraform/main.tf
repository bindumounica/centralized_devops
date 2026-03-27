# Cloud selector
locals {
  cloud_module = var.cloud_provider == "aws" ? "./aws" : var.cloud_provider == "gcp" ? "./gcp" : "./azure"
}

module "cloud_infra" {
  source = local.cloud_module
  
  region              = var.region
  app_name            = var.app_name
  cluster_name        = var.cluster_name
  project_id          = var.project_id
  resource_group_name = var.resource_group_name
  location            = var.location
  deployment_type     = var.deployment_type
  app_image           = var.app_image
}

