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
    count = 1
    ami = var.ami_id
    # ami = data.aws_ami.example

    instance_type = var.instance_type

    tags = {
        Name = "Myserver-${count.index}"
    }

}
