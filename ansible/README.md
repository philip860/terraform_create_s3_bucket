# Ansible: upload a seed file to S3

## Prereqs
- Ansible
- AWS credentials configured (same as Terraform)
- Install required collection:
```bash
cd ansible
ansible-galaxy collection install -r requirements.yml
```

## Run
1) Provision with Terraform first:
```bash
cd terraform
terraform init
terraform apply
```

2) Upload seed file with Ansible:
```bash
cd ansible
ansible-playbook upload-seed.yml
```

## Notes
- The playbook reads the bucket name via: `terraform output -raw bucket_name`
- Override variables if needed:
```bash
ansible-playbook upload-seed.yml -e tf_dir=../terraform -e object_key=seed/seed.txt
```
