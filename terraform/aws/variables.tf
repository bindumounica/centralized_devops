variable "region" {
  type = string
}

variable "app_name" {
  type = string
}

variable "deployment_type" {
  type = string
}

variable "app_image" {
  type = string
}

variable "cloud_provider" {
  type    = string
  default = "aws"
}

variable "cluster_name" {
  type    = string
  default = "poc-cluster"
}



