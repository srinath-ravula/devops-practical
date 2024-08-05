variable "name" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "subnet_config" {
  type = list(string)
}

# variable "instance" {
#   type = list
# }

variable "public_cluster" {
  type = bool
}

variable "private_cluster" {
  type = bool
}

# EKS Add-ons

variable "ebs_addon" {
  type = bool
}

variable "ebs_addon_version" {
  type    = string
  default = "v1.31.0-eksbuild.1"
}

variable "efs_addon_version" {
  type    = string
  default = "v2.0.3-eksbuild.1"
}

variable "cni_version" {
  type    = string
  default = "v1.18.2-eksbuild.1"
}
## ASG 

variable "min_nodes" {
  type = string
}

variable "max_nodes" {
  type = string
}

variable "node_instance_type" {
  type = string
}

# variable "vpc_endpoints" {
#   type = list(string)
# }