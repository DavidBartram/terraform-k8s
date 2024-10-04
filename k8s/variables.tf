variable "project_namespace" {
  description = "namespace for project, to use for unique resource naming"
  type        = string
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

variable "cluster_admin_iam_user" {
  description = "AWS IAM user to be used as the EKS cluster admin"
  type        = string
}

variable "app_name" {
  description = "Name for k8s hosted web app"
  type        = string
}