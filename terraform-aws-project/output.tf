output "vpc_id" {
    description = "ID of the VPC"
    value = aws_vpc.main.id
}

output "arn_vpc" {
    description = "value"
    value = aws_vpc.main.arn
}

output "public_subnet_id" {
    description = "ID for public subnet"
    value = aws_subnet.main.id
}

output "private_subnet_id" {
    description = "ID for private subnet"
    value = aws_subnet.private.id
}

output "private_subnet_arn" {
    description = "ARN for private subnet"
    value = aws_subnet.private.arn
}

output "aws_internet_gateway" {
    description = "ID of the internet gateway"
    value = aws_internet_gateway.main.id
}

output "aws_internet_gateway_arn" {
    description = "ARN of the internet gateway"
    value = aws_internet_gateway.main.arn
}

output "ec2_instance_id" {
    description = "ID of the EC2 instance"
    value = aws_instance.main.id
}

output "ec2_instance_public_ip" {
    description = "Public IP of the EC2 instance"
    value = aws_instance.main.public_ip
}

output "ec2_instance_private_ip" {
    description = "Private IP of the EC2 instance"
    value = aws_instance.main.private_ip
}

output "ami_id" {
    description = "AMI ID used for ec2 instance"
    value = data.aws_ami.amazon_linux.id
}

