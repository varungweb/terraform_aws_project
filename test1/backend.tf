terraform {
  backend "s3" {
    bucket         = "varungweb1-terraform-state" # change this
    key            = "test1/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}