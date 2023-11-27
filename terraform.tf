terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.2.1"
    }
    helm = {
      version = "~> 2.10.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
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

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
