output "cluster_endpoint" {
  value = azurerm_kubernetes_cluster.poc.kube_config.0.host
}

