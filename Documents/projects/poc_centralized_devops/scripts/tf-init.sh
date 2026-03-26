#!/bin/zsh
# Helper: terraform init for cloud/env

CLOUD=$1
ENV=$2

cd terraform
terraform init -backend-config=\"bucket=tf-state-$CLOUD-$ENV\"

echo \"Ready: terraform plan -var-file=../environments/$ENV.tfvars\"
