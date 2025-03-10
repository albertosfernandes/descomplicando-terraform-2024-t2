terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
        source= "hashicorp/aws"
        version= "~>5.0"
    }
  }
}

provider "aws" {
    region = us-east1
    alias = "aws-terraform"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
  }
