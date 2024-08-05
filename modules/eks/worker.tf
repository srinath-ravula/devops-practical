
# resource "aws_launch_template" "worker_node_lt" {
#   name          = "self_managed_launch_template"
#   instance_type = var.node_instance_type
#   private_dns_name_options {
#     enable_resource_name_dns_a_record = true
#   }
#   iam_instance_profile {
#     arn = aws_iam_instance_profile.eks_node_profile.arn
#   }
#   image_id = "ami-0778d3618dc8cf221"
#   network_interfaces {
#     associate_public_ip_address = false
#     security_groups             = [aws_security_group.eks_worker_sg.id]
#   }
  
#   user_data = base64encode(data.template_file.userdata.rendered)
#   tags = {
#     "kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}" = "owned"
#   }
#   key_name = data.aws_key_pair.access_key.key_name

# }

# resource "aws_autoscaling_group" "eks_asg" {
#   name             = "eks-asg"
#   min_size         = var.min_nodes
#   max_size         = var.max_nodes
#   desired_capacity = 1
#   launch_template {
#     id = aws_launch_template.worker_node_lt.id
#   }
#   vpc_zone_identifier = local.subnet_list
#   tag {
#     key = "kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}"
#     value = "owned"
#     propagate_at_launch = true
#   }
# }
