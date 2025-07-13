#!/bin/bash
apt update
apt install -y apache2

# Get the instance ID using the instance metadata
# INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data)
# Step 1: Get the IMDSv2 token
TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Step 2: Get the instance ID using the token
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id \
  -H "X-aws-ec2-metadata-token: $TOKEN")

# Install the AWS CLI
apt install -y awscli

# Download the images from S3 bucket
#aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <p>Instance_Id: <span style="color:green">$INSTANCE_ID</span></p>
  <p>Varun Gupta DevOps</p>
  
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2