variable "project_namespace" {
  description = "namespace for project, to use for unique resource naming"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}
