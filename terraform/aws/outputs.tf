output "app_endpoint" {
  value = module.app.app_endpoint
}

output "grafana_url" {
  value = module.monitoring.grafana_url
}
