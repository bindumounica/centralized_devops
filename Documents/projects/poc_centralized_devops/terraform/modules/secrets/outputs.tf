output "secret_arn" {
  value = var.cloud_provider == "aws" ? aws_secretsmanager_secret.secret[0].arn : "TBD"
}
