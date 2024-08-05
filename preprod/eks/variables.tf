variable "subnet" {
  default = ["private_subnet"]
}

variable "name" {
  default = "demo-eks"
}

variable "eks_version" {
  default = "1.29"
}
variable "node_instance_type" {
  default = "t3.medium"
}

# variable "ebs_addon" {
#   default = True
# }

# variable "efs_addon" {
#   default = False
# }

variable "public_cluster" {
  default = true
}

variable "private_cluster" {
  default = true
}

variable "max_nodes" {
  default = 4
}

variable "min_nodes" {
  default = 1
}

# variable "vpc_endpoints" {
#   default = ["com.amazonaws.ap-south-1.ec2",
#     "com.amazonaws.ap-south-1.ecr.api",
#     "com.amazonaws.ap-south-1.ecr.dkr",
#   "com.amazonaws.ap-south-1.eks",
#   "com.amazonaws.ap-south-1.ssm",
#   "com.amazonaws.ap-south-1.sts",
#   "com.amazonaws.ap-south-1.s3"]
# }
