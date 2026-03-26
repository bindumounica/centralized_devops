output "app_endpoint" {
  value = var.deployment_type == "k8s" ? kubernetes_deployment.app[0].status[0].load_balancer[0].ingress[0].hostname : "TBD"
}
