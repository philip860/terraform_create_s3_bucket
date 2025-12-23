# Terraform: S3 bucket (baseline) — v2 (custom bucket_name supported)

## How bucket naming works
- If you set `bucket_name`, Terraform uses that exact name (must be globally unique).
- If `bucket_name` is empty, Terraform generates: `<bucket_name_prefix>-<random_suffix>`

## Dry-run / check (no changes)
```bash
cd terraform
terraform init
terraform plan
```

## Deploy (generated name)
```bash
terraform apply
terraform output -raw bucket_name
```

## Deploy (custom name)
```bash
terraform apply -var "bucket_name=my-custom-bucket-name"
terraform output -raw bucket_name
```

## Destroy
```bash
terraform destroy
```
