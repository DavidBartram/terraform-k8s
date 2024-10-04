module "eks-cluster" {
  source            = "./modules/eks-cluster"
  project_namespace = var.project_namespace
  domain_name       = var.domain_name
  hosted_zone_id    = var.hosted_zone_id
}

module "kubernetes" {
  source          = "./modules/kubernetes"
  app_name        = var.app_name
  container_port  = var.container_port
  docker_image    = var.docker_image
  certificate_arn = module.eks-cluster.certificate_arn
  domain_name     = var.domain_name
  hosted_zone_id  = var.hosted_zone_id
  lb_zone_id      = var.lb_zone_id
}
