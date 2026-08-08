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

resource "aws_s3_bucket" "my_bucket" {
    bucket = "superduperbucket8899"
    tags = {
        Name = "supersupu"
    }
}

resource "aws_iam_user" "testuser" {
    name = "my-state-command-user"

    tags = {
        Name = "Myuser"
    }
}