terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.15.4"

  bucket = "hotdog77bucket"

  tags = {
    Nmae = "Publicmodule"
    Env = "dev"
  }

  versioning = {
    enabled = true
  }
}

