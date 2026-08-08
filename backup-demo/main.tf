terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }

    backend "s3" {
      bucket ="supernamespace-bucet"
      key = "remote-state-demo/terraform.tfstate"
      region = "us-east-1"
      use_lockfile = true
    }
}


provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "app-user1" {
    name = "app-user1"
}