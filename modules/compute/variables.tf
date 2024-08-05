variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "subnet" {
  type = string
}

variable "ports" {
  type = list(string)
}

variable "name" {
  type = string
}

# variable "vpc_id" {
#   type = string
# }

variable "vm_count" {
  type = string
}