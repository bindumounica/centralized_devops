variable "cloud_provider" {
  type = string
}

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

variable "replicas" {
  type    = number
  default = 2
}

variable "namespace" {
  type    = string
  default = "default"
}

variable "cluster_name" {
  type = string
}

variable "app_secret" {
  type      = string
  sensitive = true
}

variable "deps_enabled" {
  type = map(bool)
  default = {
    db = true
    queue = false
    storage = true
  }
}

variable "project_id" {
  type = string
  default = ""
}

variable "resource_group_name" {
  type = string
  default = ""
}

variable "location" {
  type = string
  default = ""
}
