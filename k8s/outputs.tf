output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value = module.eks-cluster.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value = module.eks-cluster.cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value = module.eks-cluster.cluster_name
}

output "app_host" {
  description = "Load balancer hostname"
  value = module.kubernetes.app_host
}