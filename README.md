# terraform_aws_project
Traraform EC2 VPC ALB S3 with modules

<<<<<<< HEAD
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
=======
## 🗂️ Categories
| Category       | Services                      |
| -------------- | ----------------------------- |
| **Networking** | VPC, IGW, Route Table, Subnet |
| **Security**   | Security Group                |
| **Compute**    | EC2, ALB                      |
| **Storage**    | S3                            |

## 🔌 Service Connections
| Service            | Connected To                  | Description             |
| ------------------ | ----------------------------- | ----------------------- |
| **VPC**            | IGW, Route Table, Subnets, SG | The container network   |
| **IGW**            | VPC, Internet                 | Gateway to internet     |
| **Route Table**    | Subnets, IGW                  | Defines internet route  |
| **Subnet**         | EC2, Route Table              | Public subnets with IPs |
| **Security Group** | EC2, ALB                      | Controls traffic rules  |
| **EC2**            | Subnets, SG, ALB              | Deployed into subnet    |
| **ALB**            | Subnets, SG, EC2              | Routes traffic to EC2   |
| **S3**             | Internet, optionally EC2      | Static file storage     |

---
## Architecture Diagram
<img width="985" height="590" alt="image" src="https://github.com/user-attachments/assets/057f2ef5-a3ac-4f08-8e3f-a43407368e6c" />

## AWS
<img width="512" height="512" alt="image" src="https://github.com/user-attachments/assets/5f7a974a-480a-4c26-bbb7-60874d947bfc" />


>>>>>>> d90dbdcdaeb3e7f97bdb5d49ad9a0a789077ef5f
