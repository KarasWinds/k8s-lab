terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.0.19"
    }
    helm = {
      version = "~> 2.10.0"
    }
  }
}

provider "kind" {
}

provider "helm" {
  kubernetes {
    config_path = "${path.module}/kind-config"
  }
}