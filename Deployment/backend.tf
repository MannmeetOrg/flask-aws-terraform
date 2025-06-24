terraform {
  backend "s3" {
    bucket         = "flask-app-s3bucket"
    key            = "flaskapp/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
