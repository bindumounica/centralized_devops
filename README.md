# POC Centralized DevOps Templates

Multi-cloud (AWS/GCP/Azure), any runtime (Java/Python/Node), deploy (K8s/VM/serverless), GH Actions, Terraform, Prom/Grafana alerts, cloud secrets.

## Credentials Setup

### AWS
```
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AWS_DEFAULT_REGION=us-east-1
```
Or IAM role.

### GCP
```
gcloud auth application-default login
export GOOGLE_PROJECT_ID=your-project
```
Or service account key:
```
export GOOGLE_CREDENTIALS=/path/to/key.json
```

### Azure
```
az login
export ARM_SUBSCRIPTION_ID=...
```
Or service principal:
```
export ARM_CLIENT_ID=...
export ARM_CLIENT_SECRET=...
export ARM_TENANT_ID=...
export ARM_SUBSCRIPTION_ID=...
```

### GH Actions
Repo secrets:
- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`
- `GOOGLE_CREDENTIALS` (JSON)
- `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, etc.
- `SLACK_WEBHOOK_URL`

## Usage
1. Edit `environments/dev.tfvars` (cloud_provider = "aws" | "gcp" | "azure")
2. `cd terraform && terraform init`
3. `terraform plan -var-file=../environments/dev.tfvars`
4. `terraform apply -var-file=../environments/dev.tfvars`
5. GH: `gh workflow run ci.yml`

## Testing/Verification
**After apply:**
1. **App**:
   ```
   kubectl port-forward deployment/generic-app 8080:8080
   open http://localhost:8080  # App homepage/metrics
   ```

2. **Grafana Dashboard**:
   ```
   kubectl port-forward svc/grafana 3000:80 -n monitoring
   open http://localhost:3000  # admin/prom-operator
   ```

3. **Prometheus**:
   ```
   kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 -n monitoring
   open http://localhost:9090
   ```

Cloud LB endpoints: `terraform output app_endpoint`

## Examples
`examples/python-app/Dockerfile`, K8s yamls.

See TODO.md.

