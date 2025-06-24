aws_region   = "us-east-1"
instance_type = "t2.micro"
key_name     = {{ $secrets.AWS_KEY_PAIR }}
sg-name = "	sg-04d1ac6f01f77056a" # Enter your security group name
subnet_az = "us-east-1a" # Enter your az
vpc-cidr = "10.0.0.0/16" # Enter the cidr for vpc
