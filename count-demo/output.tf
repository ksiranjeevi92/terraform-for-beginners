output "instance_public_ips" {
    description =  "Public Ip of all the EC"
    value = aws_instance.example[*].public_ip
}