# Terraform: S3 bucket (baseline)

## Prereqs
- Terraform >= 1.5
- AWS credentials configured (one of):
  - env vars: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, optionally `AWS_SESSION_TOKEN`
  - or `~/.aws/credentials`

## Deploy
```bash
cd terraform
terraform init
terraform apply
```

Terraform will output the created bucket name:
```bash
terraform output -raw bucket_name
```

## Destroy
```bash
terraform destroy
```
