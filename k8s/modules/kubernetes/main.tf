resource "kubernetes_deployment" "web_app_deployment" {
  metadata {
    name = var.app_name
    labels = {
      App = "${var.app_name}"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "${var.app_name}"
      }
    }
    template {
      metadata {
        labels = {
          App = "${var.app_name}"
        }
      }
      spec {
        container {
          image = var.docker_image
          name  = var.app_name

          port {
            container_port = var.container_port
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "web_app_service" {

  metadata {
    name = var.app_name
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-ssl-cert"         = var.certificate_arn
      "service.beta.kubernetes.io/aws-load-balancer-backend-protocol" = "http"
      "service.beta.kubernetes.io/aws-load-balancer-ssl-ports"        = "https"
      "service.beta.kubernetes.io/aws-load-balancer-ssl-negotiation-policy" = "ELBSecurityPolicy-TLS-1-2-2017-01"
    }
  }
  spec {
    selector = {
      App = kubernetes_deployment.web_app_deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      name        = "https"
      port        = 443
      target_port = var.container_port
    }

    type = "LoadBalancer"
  }
}

resource "aws_route53_record" "web_app_record" {

  depends_on = [ kubernetes_service.web_app_service ]
  zone_id = var.hosted_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = kubernetes_service.web_app_service.status.0.load_balancer.0.ingress.0.hostname
    zone_id                = var.lb_zone_id
    evaluate_target_health = false
  }
}
