data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "tfstate-own-challenge"
    key = "preprod/vpc/tfstate"
    region = "ap-south-1"
  }
}

locals {
  subnet_list = data.terraform_remote_state.network.outputs["${var.subnet}"]
}

resource "aws_instance" "compute" {
  ami = var.ami
  subnet_id = length(local.subnet_list) > 1 ? local.subnet_list[count.index] : local.subnet_list[0]
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_https.id}"]
  count = var.vm_count
  key_name = var.key_pair
  tags = {
    Name = "${var.name}-${count.index + 1}"
    project = "personal"
  }
}

resource "aws_security_group" "allow_ssh_https" {
  name = "allow ssh & https"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "common_ingress" {
  security_group_id = aws_security_group.allow_ssh_https.id
  cidr_ipv4 = "0.0.0.0/0"
  for_each = toset(var.ports)
  ip_protocol = "tcp"
  from_port = each.value
  to_port = each.value 
}

resource "aws_vpc_security_group_egress_rule" "common_egress" {
  security_group_id = aws_security_group.allow_ssh_https.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}


