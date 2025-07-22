output "subnet_id" {
    value = aws_default_subnet.default_az.id
}

output "security_groups" {
    value = aws_default_security_group.default
}

output "cidr_block" {
    value = aws_default_vpc.default.ipv6_cidr_block
}