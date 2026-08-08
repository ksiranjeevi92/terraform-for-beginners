variable "aws_region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

variable "vpc_cidr" {
    description = "CIDR block for vpc"
    type = string
    default = "10.0.0.0/16"
}

variable "project_name" {
    description = "project name"
    type = string
    default = "terraform-aws-project"
  
}

variable "public_subnet_cidr" {
  description = "CIDE block for public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDE block for private subnet"
  type = string
  default = "10.0.2.0/24"
}