output "grafana_url" {
  value = "http://grafana.${var.cluster_name}:3000"
}

output "prometheus_url" {
  value = "http://prometheus.${var.cluster_name}:9090"
}
