module "ecr" {
  source = "../../modules/ecr"
  repo-name = var.repo-name
}