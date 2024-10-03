terraform {
  required_version = ">=1.9.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.69.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = ">=2.3.5"
    }
    null = {
      source  = "hashicorp/null"
      version = ">=3.2.3"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.6.3"
    }
    time = {
      source  = "hashicorp/time"
      version = ">=0.12.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0.6"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.6.0"
    }
  }
}
