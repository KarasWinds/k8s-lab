resource "kind_cluster" "default" {
  name           = "kind"
  wait_for_ready = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }

    networking {
      pod_subnet     = "10.10.0.0/16"
      service_subnet = "10.11.0.0/16"
    }
  }
}
