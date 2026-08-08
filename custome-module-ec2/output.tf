output "server-instance_id" {
    value = module.my_ec2.instance_id
}

output "server_public_ip" {
    value = module.my_ec2.public_ip
}