variable "project_namespace" {
  description = "namespace for project, to use for unique resource naming"
  type        = string
  default     = "TestEksProject"
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
  default     = "godbound-dice-roller"
}

variable "container_port" {
  description = "Port for k8s hosted web app"
  type        = number
  default     = 5000
}

variable "docker_image" {
  description = "Docker image for k8s hosted web app"
  type        = string
  default     = "dbartramdockerhub/godbound-dice-roller:latest"
}

variable "domain_name" {
  description = "Domain name for Route53 hosted zone that you have already set up"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted zone ID for Route53 hosted zone that you have already set up"
  type        = string
}

variable "lb_zone_id" {
  description = "Zone ID for load balancer, look up in classic load balancers by region at https://docs.aws.amazon.com/general/latest/gr/elb.html"
  type        = string
}

