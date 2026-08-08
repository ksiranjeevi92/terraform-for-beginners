terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

#Configure the AWS Providers
provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "env_bucket" {
  bucket = "my-workspace-bucket-${terraform.workspace}-999"

  tags = {
    Name = "my-workspace-bucket-${terraform.workspace}"
    Environment = terraform.workspace
  }
}