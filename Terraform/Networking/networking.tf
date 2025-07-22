resource "aws_default_vpc" "default"{
  assign_generated_ipv6_cidr_block= true
}

resource "aws_default_subnet" "default_az"{
    availability_zone = "ap-south-1b"
    ipv6_cidr_block = cidrsubnet(aws_default_vpc.default.ipv6_cidr_block,8,0)
    map_public_ip_on_launch = false
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rules for IPv6
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"] # Allows SSH from any IPv6 address
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"] # Allows App traffic from any IPv6 address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

}