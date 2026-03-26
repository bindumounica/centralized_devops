variable "cloud_provider" { type = string }

variable "cluster_name" { type = string }
variable "prometheus_port" { default = 9090 }
variable "grafana_port" { default = 3000 }
