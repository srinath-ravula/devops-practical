module "eks_cluster" {
  source             = "../../modules/eks"
  eks_version        = var.eks_version
  subnet_config      = var.subnet
  name               = var.name
  ebs_addon          = true
  public_cluster     = var.public_cluster
  private_cluster    = var.private_cluster
  max_nodes          = var.max_nodes
  node_instance_type = var.node_instance_type
  min_nodes          = var.min_nodes
  
}