# resource "aws_instance" "vps-1" {
#   instance_type = "t2.micro"
#   ami = "ami-020cba7c55df1f615" # change this
#   subnet_id = "subnet-01a45c19413638cfd" # change this
#   key_name = "aws_login_us-east-1"
# }

# module "sg" {
#   source = "../modules/sg"
#   vpc_id = "vpc-079fa90c2584edd3c"
# }

resource "aws_s3_bucket" "s3_bucket2" {
  bucket = "varungweb1-terraform-created" # change this
}