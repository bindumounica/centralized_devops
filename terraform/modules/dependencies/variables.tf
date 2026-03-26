variable "deps_enabled" {
  type = map(bool)
  default = {
    db      = true
    queue   = false
    storage = true
  }
}

variable "db_type" {
  type    = string
  default = "postgres"
}

variable "storage_size_gb" {
  type    = number
  default = 20
}

variable "cloud_provider" {
  type = string
}
