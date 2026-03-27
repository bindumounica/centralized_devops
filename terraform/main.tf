# Root - selects cloud module

module "cloud_infra" {
  source = var.cloud_provider == "aws" ? "./aws" : var.cloud_provider == "gcp" ? "./gcp" : "./azure"
  
  region = var.region
  app_name = var.app_name
  deployment_type = var.deployment_type
  app_image = var.app_image
  cloud_provider = var.cloud_provider
}
