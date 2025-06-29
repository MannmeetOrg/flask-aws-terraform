# Create a Key Pair resource in AWS
resource "aws_key_pair" "my_key" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}