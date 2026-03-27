variable "cloud_provider" {
  type = string
}

variable "deployment_type" {
  type = string
}

variable "app_name" {
  type = string
}

variable "app_image" {
  type = string
}

variable "replicas" {
  type    = number
  default = 2
}

variable "namespace" {
  type    = string
  default = "default"
}
