# Generic app deployment module - cloud/runtime agnostic

# Dispatches based on vars
locals {
  provisioner = var.deployment_type == "k8s" ? "kubernetes" : var.deployment_type == "vm" ? "cloudinit" : "serverless"
}

# K8s example (extend for Helm)
resource "kubernetes_deployment" "app" {
  count = var.deployment_type == "k8s" ? 1 : 0
  metadata {
    name = var.app_name
    namespace = var.namespace
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = { app = var.app_name }
    }
    template {
      metadata {
        labels = { app = var.app_name }
      }
      spec {
        container {
          name  = var.app_name
          image = var.app_image
          # Ports/resources from vars
        }
      }
    }
  }
}

# TODO: VM/serverless conditionals (e.g., aws_instance, aws_lambda_function)
# Cloud-specific via provider alias
