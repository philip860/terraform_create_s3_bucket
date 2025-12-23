# Terraform + Ansible demo: S3 bucket + seed upload

This sample project shows a simple, scalable pattern:
1) **Terraform** provisions an S3 bucket with safe defaults.
2) **Ansible** uploads a seed object into that bucket after provisioning.

## Quickstart
```bash
# 1) Terraform: create the bucket
cd terraform
terraform init
terraform apply

# 2) Ansible: upload seed file into the created bucket
cd ../ansible
ansible-galaxy collection install -r requirements.yml
ansible-playbook upload-seed.yml
```

## Cleanup
```bash
cd terraform
terraform destroy
```
