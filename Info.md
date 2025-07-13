# 🚀 AWS Infrastructure Deployment using Terraform + Post-Deployment Automation with Python

This project demonstrates a complete DevOps workflow using **Terraform** to provision secure and scalable AWS infrastructure, with **Python (Boto3)** used for post-deployment automation (installing Docker, configuring logs to CloudWatch, etc.).

---

## 🧩 Problem Statement

Manual deployment of cloud infrastructure often leads to:
- Inconsistent environments
- Security misconfigurations
- Lack of observability
- Tedious post-setup tasks like Docker installs or logging setup

---

## ✅ Solution Overview

This project automates:
- Provisioning of AWS resources (EC2, S3, ALB, IAM, VPC, etc.)
- Secure access via IAM Roles and S3-scoped policies
- Monitoring integration using CloudWatch
- Post-deployment configuration using Python (via AWS SSM)

---

## 🔧 Tech Stack

- **Terraform** (modular setup for reusability and clarity)
- **Python (Boto3)** for post-deployment EC2 configuration
- **AWS Services**:  
  - EC2 (Ubuntu instances)
  - S3 (State backend + app files)
  - ALB (Load balancing across EC2)
  - IAM (Least privilege access)
  - CloudWatch (Log streaming)
  - VPC, Subnets, IGW, Route Tables, Security Groups

---

## 🧱 Architecture Summary

- A **modular Terraform setup** is used to create:
  - Custom VPC with public subnets across AZs
  - Internet Gateway & routing
  - Security Groups (restricted to ports 22 and 80)
  - EC2 instances in different subnets
  - Application Load Balancer routing to EC2
  - IAM roles with scoped permissions to S3 and CloudWatch
- A **backend S3 bucket** is used to store and lock Terraform state
- **User data + remote file provisioners** automate the EC2 setup process
- **Python script** is triggered post-deployment to:
  - Install Docker
  - Sync files from S3
  - Enable CloudWatch logging via SSM

---

## 🛠 Sample Python Post-Deployment Flow

```python
import boto3

ssm = boto3.client('ssm')

commands = [
    "sudo apt update -y",
    "sudo apt install -y docker.io",
    "sudo systemctl enable docker",
    "sudo systemctl start docker",
    "aws s3 sync s3://your-bucket-name /var/www/html",
]

response = ssm.send_command(
    InstanceIds=['<instance-id>'],
    DocumentName="AWS-RunShellScript",
    Parameters={'commands': commands},
)
````

---

## 📊 Monitoring Setup

* EC2 instances send logs to **CloudWatch Logs**
* IAM role `AmazonSSMManagedInstanceCore` and `CloudWatchLogsFullAccess` used
* Logs visible in real-time for debugging and performance monitoring

---

## 📈 Key Outcomes

* 🔁 Reproducible, version-controlled infrastructure deployments
* 🔐 Secure-by-default: IAM roles and SGs limit exposure
* 🚀 Faster provisioning and post-config with no manual steps
* 📦 Easily scalable with Terraform modules and ALB integration
* 🧩 Business-ready: Clear separation of responsibilities between infra and config

---

## 📂 Repo Structure

```
terraform/
│
├── modules/
│   ├── vpc/
│   ├── subnet/
│   ├── igw/
│   ├── rt/
│   ├── sg/
│   ├── ec2/
│   ├── alb/
│   └── s3/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
└── backend.tf

scripts/
└── postdeploy.py
```

---

## 🚀 How to Run

1. Configure AWS CLI credentials or set environment variables
2. Navigate to `prod/`
3. Run:

```bash
terraform init
terraform plan
terraform apply --var-file=prod.tfvars
```

4. After apply, run:

```bash
python3 postdeploy.py
```
