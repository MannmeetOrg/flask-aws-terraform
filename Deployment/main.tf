terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# ------------------------------
# EC2 Security Group
# ------------------------------
resource "aws_security_group" "flask_sg" {
  name        = "flask_app_sg"
  description = "Allow HTTP and HTTPS access"
  vpc_id      = aws_vpc.main.id  # ✅ Match this to the same VPC as subnet

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Flask (optional)
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
    Name = "flask-security-group"
  }
}

# ------------------------------
# EC2 Instance
# ------------------------------
resource "aws_instance" "flask_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  subnet_id                   = aws_subnet.main.id  # ✅ Custom VPC
  vpc_security_group_ids      = [aws_security_group.flask_sg.id] # Custom VPC
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y git make python3-pip
              cd /home/ec2-user
              git clone https://github.com/MannmeetOrg/flask-aws-terraform.git
              cd flask-aws-terraform
              make install
              EOF

  tags = {
    Name = "flask-terraform-instance"
  }
}
