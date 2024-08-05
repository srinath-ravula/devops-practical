
module "my_vpc" {
  source = "../../modules/network"
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subets = var.private_subets
  azs = var.azs
}
