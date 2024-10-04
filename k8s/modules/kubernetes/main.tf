resource "kubernetes_deployment" "web_app_deployment" {
  metadata {
    name = "${var.app_name}"
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
          image = "nginx:latest"
          name  = "${var.app_name}"

          port {
            container_port = 80
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
    name = "${var.app_name}"
  }
  spec {
    selector = {
      App = kubernetes_deployment.web_app_deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}