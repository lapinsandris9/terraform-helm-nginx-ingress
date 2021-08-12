resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = var.nginx_ingress_namespace
  }
}
resource "helm_release" "nginx-ingress" {
  name          = var.nginx_ingress_helm_release_name
  repository    = var.helm_repos.ingress-nginx
  chart         = "ingress-nginx"
  version       = var.nginx_ingress_chart_version
  wait          = true
  force_update  = false
  recreate_pods = true
  namespace     = kubernetes_namespace.ingress-nginx.metadata.0.name
  values = [
    file("${path.module}/values/nginx-ingress.yaml")
  ]
}
