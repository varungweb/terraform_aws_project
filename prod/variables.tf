variable "vpc_cidr" {
  description = "Cidr for Complete VPC mainly /16 ."
}

variable "bucket_name" {
  description = "S3 Bucket name which will be public."
}

variable "instance_type" {
  description = "Instance Type (t2.micro)"
}

variable "ubuntu_ami" {
  description = "AMI ID for OS (Ubuntu)"
}

variable "subnet1_cidr" {
  description = "Subnet1 CIDR Range"
}

variable "subnet2_cidr" {
  description = "Subnet2 CIDR Range"
}

variable "subnet3_cidr" {
  description = "Subnet3 CIDR Range"
}

variable "region_name" {
  description = "Set Region Name"
}

variable "az1" {
  description = "AZ 1 Name"
}

variable "az2" {
  description = "AZ 2 Name"
}

variable "az3" {
  description = "AZ 3 Name"
}

variable "user_data_filename" {
  description = "Shell Script Filename for server 1"
}

variable "user_data2_filename" {
  description = "Shell Script Filename for server 2"
}

variable "user_data3_filename" {
  description = "Shell Script Filename for server 3"
}

variable "key_name" {
  description = "key pair name"
}