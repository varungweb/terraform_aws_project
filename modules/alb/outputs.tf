# output "loadbalancerdns" {
#   value = aws_lb.this.dns_name
# }
output "dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.this.dns_name
}
