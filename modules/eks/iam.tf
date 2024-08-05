data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "eksClusterRole" {
  name               = "demo-eksClusterRole"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}

resource "aws_iam_policy_attachment" "eks_cluster_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  roles      = [aws_iam_role.eksClusterRole.name]
  name       = "cluster_role_attachment"
}


# resource "aws_iam_instance_profile" "eks_node_profile" {
#   name = "eks_node_profile"
#   role = aws_iam_role.eks_node_group_role.name
# }

data "aws_iam_policy_document" "nodegroup_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "nodegroup_AmazonEKSNodeRole" {
  name               = "demo-node_AmazonEKSNodeRole"
  assume_role_policy = data.aws_iam_policy_document.nodegroup_role.json
}

resource "aws_iam_role_policy_attachment" "nodegroup_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodegroup_AmazonEKSNodeRole.name
}
resource "aws_iam_role_policy_attachment" "nodegroup_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodegroup_AmazonEKSNodeRole.name
}
resource "aws_iam_role_policy_attachment" "nodegroup_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodegroup_AmazonEKSNodeRole.name
}