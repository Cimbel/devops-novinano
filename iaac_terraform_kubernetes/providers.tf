provider "aws" {
  region = "us-east-2"
}

# shows all availability zones in the current region
data "aws_availability_zones" "available" {
  state = "available"
}


terraform {
  backend "s3" {
    bucket = "novinano-terraform-secrets"
    key    = "terraform_secrets/terraform.tfstate"
    region = "us-east-2"
  }
}
