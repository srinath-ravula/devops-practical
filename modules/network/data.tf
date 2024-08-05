data "aws_availability_zones" "az" {
  all_availability_zones = true
  state = "available"
  filter {
    name = "zone-name"
    values = ["ap-south-1a", "ap-south-1b"]
  }
}