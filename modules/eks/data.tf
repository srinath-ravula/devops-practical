
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "tfstate-own-challenge"
    key    = "preprod/vpc/tfstate"
    region = "ap-south-1"
  }
}

data "aws_key_pair" "access_key" {
  key_name = "personal_aws"
}

data "terraform_remote_state" "jumphost_sg" {
  backend = "s3"
  config = {
    bucket = "tfstate-own-challenge"
    key    = "preprod/compute/tfstate"
    region = "ap-south-1"
  }
}

data "aws_ssm_parameter" "eks_ami_release_version" {
  name = "/aws/service/eks/optimized-ami/${aws_eks_cluster.eks_cluster.version}/amazon-linux-2/recommended/release_version"
}