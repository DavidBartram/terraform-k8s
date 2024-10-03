
module "eks-auth" {
  source  = "aidanmelen/eks-auth/aws"
  version = "1.0.0"
  eks = var.eks
  map_users = [
    {
      userarn  = "arn:aws:iam::${var.account_id}:user/${var.cluster_admin_iam_user}"
      username = "${var.cluster_admin_iam_user}"
      groups   = ["system:masters", "system:nodes"]
    },
  ]

}