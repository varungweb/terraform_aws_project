# terraform_aws_project
Traraform EC2 VPC ALB S3 with modules

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
<img width="2167" height="1298" alt="image" src="https://github.com/user-attachments/assets/057f2ef5-a3ac-4f08-8e3f-a43407368e6c" />


