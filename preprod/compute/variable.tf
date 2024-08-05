variable "ec2_name" {
  default = "jump_box"
}

variable "ports" {
  default = ["22", 
  "443"
  ]
}

variable "subnet" {
  default = "public_subnet"
}

variable "key_pair" {
  default = "personal_aws"
}

variable "ami" {
  default = "ami-0cc9838aa7ab1dce7"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vm_count" {
  default = "1"
}