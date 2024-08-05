module "compute_ec2" {
  source = "../../modules/compute"
  name = var.ec2_name
  ami = var.ami
  subnet = var.subnet
  ports = var.ports
  key_pair = var.key_pair
  instance_type = var.instance_type
  vm_count = var.vm_count
}