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
  region = var.aws_region
}

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "${var.project_name}-vpc"
      Project = var.project_name
    }
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-gw"
    Project = var.project_name
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-rt"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "main" {
  subnet_id = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}


resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "${var.project_name}-private-subnet"
    Project = var.project_name
  }
}


data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "main" {
    name = "allow_tls"
    description = "Allow TLS inbound traffic and allow all outbound traffic"
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "${var.project_name}-sg"
      Project = var.project_name
    }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4 = var.ingress_cidr
  from_port = var.ssh_port
  ip_protocol = "tcp"
  to_port = var.ssh_port
  tags = {
    Name = "${var.project_name}-inbound-sg"
    Project = var.project_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
    security_group_id = aws_security_group.main.id
    cidr_ipv4 = var.ingress_cidr
    from_port = var.http_port
    to_port = var.http_port
    ip_protocol = "tcp"
    
    tags = {
    Name = "${var.project_name}-inbound-http"
    Project = var.project_name
  }
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4 = var.egress_cidr

  ip_protocol = "-1"

  tags = {
    Name = "${var.project_name}-outbound-all"
    Project = var.project_name
  }
}

resource "aws_instance" "main" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.main.id]

  key_name = var.key_name

  depends_on = [ 
    aws_security_group.main,
    aws_vpc_security_group_egress_rule.all,
    aws_vpc_security_group_ingress_rule.ssh,
    aws_vpc_security_group_ingress_rule.http
   ]

  tags = {
    Name = "${var.project_name}-ec2-machine"
    Project = var.project_name
  }
}