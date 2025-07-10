resource "aws_instance" "this" {
  for_each               = var.instances
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = each.value.subnet_id
  user_data_base64       = base64encode(file(each.value.user_data))
}
