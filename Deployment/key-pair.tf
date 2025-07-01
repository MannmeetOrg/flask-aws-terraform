resource "aws_key_pair" "auth" {
  key_name   = var.key_pair_name
  public_key = file("/d/Manmeet/flask-key.pub")
}
