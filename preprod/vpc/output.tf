output "vpc_id" {
  value = module.my_vpc.vpc_id
}

output "igw" {
  value = module.my_vpc.aws_internet_gateway
}

output "private_subnet" {
  value = module.my_vpc.private_subnet
}

output "public_subnet" {
  value = module.my_vpc.public_subnet
}
