variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "EC2 Key Pair Name"
  type        = string
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (Free Tier)
}

variable "vpc_id" {
  description = "Default or custom VPC ID"
  type        = string
}
variable "vpc-cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "sg-name" {
  description = "Name of the security group"
  type        = string
}
variable "public_key" {}