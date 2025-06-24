terraform {
  backend "s3" {
    bucket         = "flaskapp-bucket"
    key            = "flaskapp/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
