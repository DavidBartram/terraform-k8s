output "app_host" {
  description = "Load balancer hostname"
  value       = kubernetes_service.web_app_service.status.0.load_balancer.0.ingress.0.hostname
}