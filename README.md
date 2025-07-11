# terraform_aws_project
Traraform EC2 VPC ALB S3 with modules

```bash
cd prod
```

```bash
terraform plan --var-file=prod.tfvars
```

```bash
terraform apply --var-file=prod.tfvars
```

```bash
terraform destroy --var-file=prod.tfvars
```

## Warning
```bash
terraform apply --var-file=prod.tfvars -auto-approve
```

```bash
terraform destroy --var-file=prod.tfvars -auto-approve
```