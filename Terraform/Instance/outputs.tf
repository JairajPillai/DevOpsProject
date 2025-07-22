output "public_ipv6" {
  description = "The public IPv6 address of the EC2 instance"
  value       = aws_instance.project_instance.ipv6_addresses[0]
}