terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
}

# VPC
resource "aws_vpc" "fuzzyblog-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fuzzyblog-prod-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "fuzzyblog-gw" {
  vpc_id = aws_vpc.fuzzyblog-vpc.id
}

# Route Table
resource "aws_route_table" "fuzzyblog-rt" {
  vpc_id = aws_vpc.fuzzyblog-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fuzzyblog-gw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.fuzzyblog-gw.id
  }

  tags = {
    Name = "fuzzyblog-prod"
  }
}

# Subnet
resource "aws_subnet" "fuzzyblog-subnet" {
  vpc_id            = aws_vpc.fuzzyblog-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "fuzzyblog-prod-subnet"
  }
}

# Route Table Association
resource "aws_route_table_association" "fuzzyblog-rta-1" {
  subnet_id      = aws_subnet.fuzzyblog-subnet.id
  route_table_id = aws_route_table.fuzzyblog-rt.id
}

# Security Group
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.fuzzyblog-vpc.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

# Network Interface
resource "aws_network_interface" "prod" {
  subnet_id       = aws_subnet.fuzzyblog-subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]
}

# Elastic IP Address
resource "aws_eip" "eip" {
  vpc                       = true
  network_interface         = aws_network_interface.prod.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.fuzzyblog-gw]
}

output "server_public_ip" {
  value = aws_eip.eip.public_ip
}

# Ubuntu EC2 Instance
resource "aws_instance" "fuzzyblog-web" {
  ami               = "ami-0a91cd140a1fc148a"
  instance_type     = "t2.micro"
  availability_zone = "us-east-2a"
  key_name          = "aws-rails-access-key"
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.prod.id
  }

  # user_data = <<-EOF
  #   #!/bin/bash
  #   sudo apt update -y
  #   sudo apt install apache2 -y
  #   sudo systemctl start apache2
  #   sudo bash -c 'echo your very first web server > /var/www/html/index.html'
  # EOF

  tags = {
    Name  = "FuzzyBlog"
    Owner = "Chris Johnston"
  }
}

# Create S3 Bucket
resource "aws_s3_bucket" "fuzzyblog-s3-bucket" {
  bucket = "fuzzyblog-images"
  acl    = "private"

  tags = {
    Name        = "fuzzyblog-prod-s3-images"
    Environment = "Prod"
  }
}
