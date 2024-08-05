variable "vpc_cidr" {
  default = "10.101.96.0/20"
}

variable "private_subets" {
  default = ["10.101.99.0/24", "10.101.103.0/24"]
}

variable "public_subnets" {
  default = "10.101.97.128/25"
}



variable "azs" {
  default = ["ap-south-1a","ap-south-1b"]
}


