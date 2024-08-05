output "ec2_public_ip" {
  value = module.compute_ec2.ec2_public_ip
}

output "ec2_private_ip" {
  value = module.compute_ec2.ec2_ip
}

output "security_group_id" {
  value = module.compute_ec2.ssh_security_group_id
}