output "vpc_id" {
    description = "ID of the VPC"
    value = aws_vpc.main.id
}

output "arn_vpc" {
    description = "value"
    value = aws_vpc.main.arn
}