resource "aws_instance" "project_instance" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  key_name =  "ec2-key"
  
  ipv6_address_count = 1
  vpc_security_group_ids = [var.security_groups.id]

  tags = {
    Name = "ProjectInstance"
  }
}