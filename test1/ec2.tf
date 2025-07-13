resource "aws_instance" "vps-1" {
  instance_type        = "t2.micro"
  ami                  = "ami-020cba7c55df1f615"    # change this
  subnet_id            = "subnet-01a45c19413638cfd" # change this
  key_name             = "aws_login_us-east-1"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "EC2WithS3Access"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("../../aws_login_us-east-1.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "install.sh"
    destination = "/home/ubuntu/install-docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y bpytop",
      "cd /home/ubuntu/",
      "chmod +x install-docker.sh",
      "bash install-docker.sh"
    ]
  }
}

module "sg" {
  source = "../modules/sg"
  vpc_id = "vpc-079fa90c2584edd3c"
}