# ##### VPC Related

# module "vpc" {
#   source = "../modules/vpc"
#   cidr   = var.vpc_cidr
# }

# module "subnet" {
#   source = "../modules/subnet"
#   vpc_id = module.vpc.vpc_id
#   subnets = {
#     subnet1 = { cidr = var.subnet1_cidr, az = var.az1 }
#     subnet2 = { cidr = var.subnet2_cidr, az = var.az2 }
#     subnet3 = { cidr = var.subnet3_cidr, az = var.az3 }
#   }
# }

# module "igw" {
#   source = "../modules/igw"
#   vpc_id = module.vpc.vpc_id
# }

# module "route_table" {
#   source = "../modules/rt"
#   vpc_id = module.vpc.vpc_id
#   igw_id = module.igw.igw_id
#   subnet_ids = {
#     subnet1 = module.subnet.subnet_ids[0]
#     subnet2 = module.subnet.subnet_ids[1]
#     subnet3 = module.subnet.subnet_ids[2]
#   }
# }

# module "sg" {
#   source = "../modules/sg"
#   vpc_id = module.vpc.vpc_id
# }


# ##### S3 Related

module "s3" {
  source      = "../modules/s3"
  bucket_name = var.bucket_name
}

# ##### Ec2 Related

# module "ec2" {
#   source        = "../modules/ec2"
#   ami           = var.ubuntu_ami
#   instance_type = var.instance_type
#   sg_id         = module.sg.security_group_id
#   key_name      = var.key_name
#   instances = {
#     "vps-1" = {
#       subnet_id = module.subnet.subnet_ids[0]
#       user_data = var.user_data_filename
#     }
#     "vps-2" = {
#       subnet_id = module.subnet.subnet_ids[1]
#       user_data = var.user_data2_filename
#     }
#     "vps-3" = {
#       subnet_id = module.subnet.subnet_ids[2]
#       user_data = var.user_data3_filename
#     }
#   }
# }

# module "alb" {
#   source     = "../modules/alb"
#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.subnet.subnet_ids
#   sg_id      = module.sg.security_group_id
#   targets = {
#     "vps-1" = module.ec2.instances["vps-1"].id
#     "vps-2" = module.ec2.instances["vps-2"].id
#     "vps-3" = module.ec2.instances["vps-3"].id
#   }
# }
