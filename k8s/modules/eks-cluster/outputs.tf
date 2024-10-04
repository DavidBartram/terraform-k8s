output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eksTestCluster.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eksTestCluster.cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eksTestCluster.cluster_name
}

output "cluster_certificate_authority_data" {
  description = "Kubernetes Cluster CA data"
  value       = module.eksTestCluster.cluster_certificate_authority_data
}

output "eks" {
  description = "EKS Cluster"
  value       = module.eksTestCluster
}

output "certificate_arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.cert.arn
}