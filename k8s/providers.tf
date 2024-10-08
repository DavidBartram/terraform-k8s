provider "aws" {
  profile = "tf-deploy"
  region  = var.region
}

provider "kubernetes" {
  host                   = module.eks-cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks-cluster.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["--profile", var.profile, "eks", "get-token", "--cluster-name", module.eks-cluster.cluster_name]
  }
}