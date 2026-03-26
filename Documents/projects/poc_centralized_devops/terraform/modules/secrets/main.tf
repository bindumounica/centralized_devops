# Cloud-native secrets module
# Uses count/conditional for provider

resource "aws_secretsmanager_secret" "secret" {
  count = var.cloud_provider == "aws" ? 1 : 0
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "version" {
  count    = var.cloud_provider == "aws" ? 1 : 0
  secret_id     = aws_secretsmanager_secret.secret[0].id
  secret_string = var.secret_value
}

# TODO: GCP Secret Manager, Azure Key Vault equivalents
