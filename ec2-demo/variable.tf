variable "instance_type" {
    description = "Type of EC2 instance"
    type = string
    default = "t3.micro"
}

variable "ami_id" {
    description = "AMI ID for EC2 instance"
    type = string
    default = "ami-004f790b835b26145"
}

variable "server_name" {
    description = "Name tag for EC2 instance"
    type = string
    default = "MyFirstEC2"
  
}