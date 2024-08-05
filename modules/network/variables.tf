variable "vpc_cidr" {
    type = string
}
variable "azs" {
    type = list(string)
}
variable "private_subets" {
    type = list(string)
}
variable "public_subnets" {
  type = string
}

