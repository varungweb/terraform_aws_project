provider "aws" {
  region = "us-east-1"
}

# resource "aws_instance" "vps-1" {
#   instance_type = "t2.micro"
#   ami = "ami-020cba7c55df1f615" # change this
#   subnet_id = "subnet-01a45c19413638cfd" # change this
#   key_name = "aws_login_us-east-1"
# }

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "varungweb1-terraform-state" # change this
}

# resource "aws_s3_bucket" "s3_bucket2" {
#   bucket = "varungweb1-terraform-created" # change this
# }

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}