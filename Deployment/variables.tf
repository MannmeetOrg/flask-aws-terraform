variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "subnet_az" {
  description = "Availability Zone for subnet"
  type        = string
}

variable "key_pair_name" {
  description = "EC2 Key Pair name for SSH"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "Optional vpc_id input"
}
variable "ssh_public_key" {
  type        = string
  description = "Public key used for ssh access"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}