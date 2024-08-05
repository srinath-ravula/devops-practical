resource "aws_ecr_repository" "ecr-repo" {
  name = var.repo-name
  image_tag_mutability = "MUTABLE"
}