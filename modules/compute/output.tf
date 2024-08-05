output "ec2_ip" {
  value = aws_instance.compute[*].private_ip
}

output "ec2_public_ip" {
  value = aws_instance.compute[*].public_ip
}

output "ssh_security_group_id" {
  value = aws_security_group.allow_ssh_https.id
}
