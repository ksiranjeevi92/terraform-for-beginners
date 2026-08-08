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


module "my_ec2" {
    source = "./module/ec2"

    ami_id = "ami-004f790b835b26145"

    server_name = "EC2"
}
