resource "aws_instance" "flask_app" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y python3 git make
    cd /home/ec2-user
    git clone https://github.com/yourusername/flaskapp-terraform-deploy.git
    cd flaskapp-terraform-deploy
    make install
  EOF

  tags = {
    Name = "FlaskAppInstance"
  }

  vpc_security_group_ids = [aws_security_group.allow_http.id]
}
