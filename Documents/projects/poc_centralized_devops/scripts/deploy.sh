#!/bin/zsh
# Deploy helper

ENV=$1
cd terraform
terraform apply -var-file=../environments/$ENV.tfvars -auto-approve

