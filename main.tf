resource "kind_cluster" "default" {
  name            = "kind"
  wait_for_ready  = true
  kubeconfig_path = "${path.module}/kind-config"
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

      disable_default_cni = true
      kube_proxy_mode     = "none"
    }
  }
}

resource "helm_release" "cilium" {
  depends_on = [
    kind_cluster.default
  ]
  name       = "cilium"
  repository = "https://helm.cilium.io"
  chart      = "cilium"
  version    = "1.14.4"

  namespace = "kube-system"

  values = [
    "${file("cilium.yaml")}"
  ]
}
