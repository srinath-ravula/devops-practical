

# resource "aws_security_group" "eks_worker_sg" {
#   name   = "eks_worker_node_sg"
#   vpc_id = data.terraform_remote_state.network.outputs.vpc_id
#   tags = {
#     "Name" = "${var.name}-eks_cluster_sg"
#   }
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group_rule" "eks_worker_sg_rule" {
#   description              = "Allowing traffic within the node group"
#   protocol                 = -1
#   security_group_id        = aws_security_group.eks_worker_sg.id
#   from_port                = 0
#   to_port                  = 65535
#   type                     = "ingress"
#   source_security_group_id = aws_security_group.eks_worker_sg.id
# }

resource "aws_security_group_rule" "allow_ssh" {
  description              = "allow https from jump host"
  protocol                 = "tcp"
  security_group_id        = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  source_security_group_id = data.terraform_remote_state.jumphost_sg.outputs.security_group_id
  from_port                = 443
  to_port                  = 443
  type                     = "ingress"
}

# resource "aws_security_group_rule" "allowing_trafic_to_endpoints" {
#   description = ""
#   protocol = "tcp"
#   security_group_id = aws_security_group.eks_worker_sg.id
#   source_security_group_id = aws_security_group.vpc_endpoint_sg.id
#   from_port = 443
#   to_port = 443
#   type = "egress"
# }


# resource "aws_security_group_rule" "pods_to_cluster_api" {
#   description = "Allow pods to communicate with the cluster API Server"
#   protocol = "tcp"
#   security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
#   source_security_group_id = aws_security_group.eks_worker_sg.id
#   from_port = 443
#   to_port = 443
#   type = "ingress"
# }

# resource "aws_security_group_rule" "ControlPlane_ToNodeSecurityGroupOn443" {
#   description = "Allow the cluster control plane to communicate with pods running extension API servers on port 443"
#   protocol = "tcp"
#   security_group_id = aws_security_group.eks_worker_sg.id
#   source_security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
#   from_port = 443
#   to_port = 443
#   type = "egress"
# }
# resource "aws_security_group_rule" "ControlPlane_ToNodeSecurityGroup" {
#   description = "Allow the cluster control plane to communicate with worker Kubelet and pods"
#   protocol = "tcp"
#   security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
#   source_security_group_id = aws_security_group.eks_worker_sg.id
#   from_port = 1025
#   to_port = 65535
#   type = "egress"
# }

# resource "aws_security_group_rule" "NodeSecurityGroup_FromControlPlane" {
#   description = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
#   protocol = "tcp"
#   security_group_id = aws_security_group.eks_worker_sg.id
#   source_security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
#   from_port = 1025
#   to_port = 35535
#   type = "ingress"
# }

# resource "aws_security_group_rule" "NodeSecurityGroup_ControlPlaneOn443" {
#   description = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane"
#   protocol = "tcp"
#   security_group_id = aws_security_group.eks_worker_sg.id
#   source_security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
#   from_port = 443
#   to_port = 443
#   type = "ingress"
# }

# resource "aws_security_group" "vpc_endpoint_sg" {
#   name = "${var.name}_endpoint_sg"
#   vpc_id = data.terraform_remote_state.network.outputs.vpc_id
#   tags = {
#     name = "${var.name}_endpoint_sg"
#   }
# }

# resource "aws_security_group_rule" "vpc_endpoint_sg_rule" {
#   security_group_id = aws_security_group.vpc_endpoint_sg.id
#   cidr_blocks = ["10.101.96.0/20"]
#   type = "ingress"
#   protocol = "tcp"
#   to_port = 443
#   from_port = 443
# }