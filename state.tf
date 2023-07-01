terraform {
  backend "s3" {
  bucket ="terraform-ram72"
  key ="roboshop/prod/terraform.tfstate"
  region="us-east-1"
  }
}

