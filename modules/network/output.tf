output "vpc_id" {
  value = aws_vpc.app_vpc.id
}

output "public_subnet" {
  value = aws_subnet.app_public_subnet[*].id
}

output "private_subnet" {
  value = aws_subnet.app_private_subnet[*].id
}
output "aws_internet_gateway" {
  value = aws_internet_gateway.app_gw.arn
}