variable "ami_id" {
    description = "AMI ID for EC2 Instance"
    type = string
}

variable "instance_type" {
    description = "Name of the instance type to use with EC2"
    type = string
    default = "t2.micro"
}

variable "server_name"{
    description = "Name tag of EC2 machine"
    type = string
}