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

resource "aws_instance" "example" {
    ami = var.ami_id

    instance_type = var.instance_type

    tags = {
        Name = var.server_name
    }
}
