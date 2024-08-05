locals {
  subnet_list = data.terraform_remote_state.network.outputs["${var.subnet_config}" [0]]
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.name
  role_arn = aws_iam_role.eksClusterRole.arn
  version  = var.eks_version
  vpc_config {
    subnet_ids              = local.subnet_list
    endpoint_public_access  = var.public_cluster
    endpoint_private_access = var.private_cluster
  }
  
  depends_on = [aws_iam_role.eksClusterRole,
  aws_iam_policy_attachment.eks_cluster_role_policy_attachment]
  # provisioner "local-exec" {
  #   command = "aws eks update-kubeconfig --region ap-south-1 --name ${var.name}"
  # }
}


resource "aws_eks_addon" "ebs_eks_addon" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = "aws-ebs-csi-driver"
  addon_version = var.ebs_addon_version
}

# resource "aws_eks_addon" "cni_eks_addon" {
#   cluster_name  = aws_eks_cluster.eks_cluster.name
#   addon_name    = "vpc-cni"
#   addon_version = var.cni_version
# }

# resource "local_file" "running_aws_config" {
#   content  = data.template_file.auth_config.rendered
#   filename = "aws-auth-config.yaml"
#   provisioner "local-exec" {
#     command = "kubectl apply -f aws-auth-config.yaml"
#   }
#   depends_on = [aws_eks_cluster.eks_cluster]
# }



#Below code block creates managed node group

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_role_arn = aws_iam_role.nodegroup_AmazonEKSNodeRole.arn
  node_group_name = "${var.name}-nodegroup"
  subnet_ids = local.subnet_list
  release_version = nonsensitive(data.aws_ssm_parameter.eks_ami_release_version.value)
  scaling_config {
    desired_size = 1
    max_size = 2
    min_size = 1
  }
  disk_size = 20
  depends_on = [ 
    aws_iam_role_policy_attachment.nodegroup_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.nodegroup_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodegroup_AmazonEKSWorkerNodePolicy
  ]
  lifecycle {
    ignore_changes = [ scaling_config ]
  }

}
