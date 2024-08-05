output "cluster_role" {
  value = aws_iam_role.eksClusterRole.arn
}

output "node_role" {
  value = aws_iam_role.nodegroup_AmazonEKSNodeRole.arn
}

output "eks_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_sg" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "certificateAuthority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

