resource "kubectl_manifest" "namespace" {
  yaml_body = file("${path.module}/../k8s/namespace.yaml")
}

resource "kubectl_manifest" "deployment" {
  depends_on = [kubectl_manifest.namespace]

  yaml_body = file("${path.module}/../k8s/deployment.yaml")
}

resource "kubectl_manifest" "service" {
  depends_on = [kubectl_manifest.deployment]

  yaml_body = file("${path.module}/../k8s/service.yaml")
}