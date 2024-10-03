module eks-cluster {
    source = "./modules/eks-cluster"
    project_namespace = var.project_namespace
}

module eks-auth {
    source = "./modules/eks-auth"
    account_id = data.aws_caller_identity.current.account_id
    eks = module.eks-cluster.eks
    cluster_admin_iam_user = var.cluster_admin_iam_user
}

data "aws_caller_identity" "current" {}