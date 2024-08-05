# data "template_file" "auth_config" {
#   template = file("${path.module}/templates/aws-auth-config.yaml.tpl")
#   vars = {
#     role_arn = "${aws_iam_role.eks_node_group_role.arn}"
#   }
# }

# data "template_file" "userdata" {
#   template = file("${path.module}/templates/userdata.sh.tpl")
#   vars = {
#     EKS_CLUSTER_API = "${aws_eks_cluster.eks_cluster.endpoint}"
#     EKS_CLUSTER_CA  = "${aws_eks_cluster.eks_cluster.certificate_authority[0].data}"
#   }
# }