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

resource "aws_s3_bucket"  "ourtest" {
    bucket  = "testbucketsiran"
}


