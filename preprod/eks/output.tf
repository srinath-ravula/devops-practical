output "eks_endpoint" {
  value = module.eks_cluster.eks_endpoint
}

output "certificateAuthority-data" {
  value = module.eks_cluster.certificateAuthority-data
}

output "eks_role" {
  value = module.eks_cluster.cluster_role
}

output "node_role" {
  value = module.eks_cluster.node_role
}