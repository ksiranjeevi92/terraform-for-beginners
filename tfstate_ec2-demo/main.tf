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
    //ami = var.ami_id
    ami = "ami-004f790b835b26145"

    instance_type = "t2.micro"

    tags = {
        Name = "my ec2"
    }

}
