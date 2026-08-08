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

variable "instances" {
    type = map(string)
    default = {
        "dev" = "t2.small"
        "stagning" = "t2.small"
        "prod" = "t2.micro"
    }
}

resource "aws_instance" "my_server" {
    //ami = var.ami_id
    for_each = var.instances

    ami = "ami-004f790b835b26145"

    instance_type = each.value

    tags =  {
        Name = "Myserver-${each.key}"
        Env = each.key
    }

}
