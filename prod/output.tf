# output "loadbalancerdns" {
#   value = aws_lb.this.dns_name
# }
output "loadbalancer_dns" {
  description = "DNS name of ALB"
  value       = module.alb.dns_name
}
