
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "EKS-VPC"
  }
}

resource "aws_subnet" "app_public_subnet" {
  vpc_id = aws_vpc.app_vpc.id
  cidr_block = var.public_subnets
  availability_zone = element(var.azs, 0)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "eks-public-subnet"
  }
}

resource "aws_subnet" "app_private_subnet" {
  vpc_id = aws_vpc.app_vpc.id
  count = length(var.private_subets)
  cidr_block = var.private_subets[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    "Name" = "esk-private-subnet${count.index}"
  }
}

resource "aws_internet_gateway" "app_gw" {
  vpc_id = aws_vpc.app_vpc.id
}

resource "aws_route_table" "public_route" {
  
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_gw.id
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id = aws_subnet.app_public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table" "Nat-route" {
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_vpc_Nat.id
  }
}

resource "aws_route_table_association" "nat-route-association" {
  count = length(aws_subnet.app_private_subnet)
  subnet_id = aws_subnet.app_private_subnet[count.index].id
  route_table_id = aws_route_table.Nat-route.id
}


resource "aws_nat_gateway" "eks_vpc_Nat" {
  subnet_id = aws_subnet.app_public_subnet.id
  allocation_id = aws_eip.Nat-Gateway-EIP.id
}

resource "aws_eip" "Nat-Gateway-EIP" {
  
}