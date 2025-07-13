# terraform_aws_project
Traraform EC2 VPC ALB S3 with modules

## Test1

```bash
cd test1
```

```bash
terraform fmt && terraform validate
```

```bash
terraform apply -auto-approve
```

```bash
python3 postdeploy.py
```

```bash
terraform destroy -auto-approve
```

## Prod
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

#### when Dynamodb table created or statefile  backend config added.
```bash
terraform init -reconfigure
```

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

### **Overall Summary**

The conversation details the deployment of AWS resources using Terraform, including the creation of EC2 instances, S3 buckets, and a load balancer, along with the implementation of a backend for state file management and security group configurations, and post-deployment tasks using Python.

---

### **Key Points**

* **AWS Resources Deployment**

  * AWS resources (EC2 instances, S3 buckets, and a load balancer) were deployed using Terraform.
  * The process involved configuring various settings like instance types, subnets, and security groups.

* **Terraform State Management**

  * A backend was implemented using S3 for storing the Terraform state file, ensuring better management and preventing accidental data loss or corruption.

* **Security Groups**

  * Security groups were configured to restrict access to only necessary ports (80 and 22), enhancing the security of the deployed resources.

* **Load Balancer Configuration**

  * A load balancer was set up to distribute traffic across multiple EC2 instances, improving application availability and scalability.

* **Post-deployment Tasks**

  * Post-deployment tasks were executed using a Python script, automating tasks like installing Docker and verifying the successful deployment.

* **IAM Roles and Policies**

  * IAM roles and policies were created and assigned to EC2 instances and S3 buckets to manage access control effectively.
  * This involved creating custom policies for specific access needs.

* **Monitoring with CloudWatch**

  * CloudWatch was configured to monitor the deployed resources and collect logs for troubleshooting and performance analysis.
  * The logs were accessed via a Python script.

---
## Architecture Diagram
<img width="985" height="590" alt="image" src="https://github.com/user-attachments/assets/057f2ef5-a3ac-4f08-8e3f-a43407368e6c" />

## AWS
<img width="512" height="512" alt="image" src="https://github.com/user-attachments/assets/5f7a974a-480a-4c26-bbb7-60874d947bfc" />


