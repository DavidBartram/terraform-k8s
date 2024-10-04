variable "project_namespace" {
  description = "namespace for project, to use for unique resource naming"
  type        = string
  default = "TestEksProject"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "tf-deploy"
}

variable "app_name" {
  description = "Name for k8s hosted web app"
  type        = string
  default = "godbound-dice-roller"
}

variable container_port {
  description = "Port for k8s hosted web app"
  type        = number
  default = 5000
}

variable docker_image {
  description = "Docker image for k8s hosted web app"
  type        = string
  default = "dbartramdockerhub/godbound-dice-roller:latest"
}