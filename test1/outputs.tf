output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.vps-1.public_ip
}

output "instance_id" {
  description = "Instance Id"
  value = aws_instance.vps-1.id
}