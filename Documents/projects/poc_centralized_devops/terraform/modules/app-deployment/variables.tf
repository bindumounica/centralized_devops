variable "cloud_provider" {
  type = string
}

variable "deployment_type" {
  type = string
  validation {
    condition     = contains(["k8s", "vm", "serverless"], var.deployment_type)
    error_message = "Must be k8s, vm, or serverless."
  }
}

variable "app_name" { type = string }
variable "app_image" { type = string }
variable "replicas" { type = number, default = 2 }

variable "namespace" { default = "default" }
