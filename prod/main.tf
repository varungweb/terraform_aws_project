module "vpc" {
  source = "../modules/vpc"
  cidr   = "10.10.0.0/16"
}

module "subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnets = {
    subnet1 = { cidr = "10.10.0.0/24", az = "ap-south-1a" }
    subnet2 = { cidr = "10.10.1.0/24", az = "ap-south-1b" }
  }
}

module "igw" {
  source = "../modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "../modules/rt"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  subnet_ids = {
    subnet1 = module.subnet.subnet_ids[0]
    subnet2 = module.subnet.subnet_ids[1]
  }
  #   subnet_ids = module.subnet.subnet_ids
}

module "sg" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "s3" {
  source      = "../modules/s3"
  bucket_name = "varungweb1"
}

module "ec2" {
  source        = "../modules/ec2"
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  sg_id         = module.sg.security_group_id
  instances = {
    "vps-1" = {
      subnet_id = module.subnet.subnet_ids[0]
      user_data = "userdata.sh"
    }
    "vps-2" = {
      subnet_id = module.subnet.subnet_ids[1]
      user_data = "userdata2.sh"
    }
  }
}

module "alb" {
  source     = "../modules/alb"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnet.subnet_ids
  sg_id      = module.sg.security_group_id
  targets = {
    "vps-1" = module.ec2.instances["vps-1"].id
    "vps-2" = module.ec2.instances["vps-2"].id
  }
}
