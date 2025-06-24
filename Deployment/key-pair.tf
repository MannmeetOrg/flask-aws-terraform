resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("/c/Users/your_user/.ssh/id_rsa.pub")
}
