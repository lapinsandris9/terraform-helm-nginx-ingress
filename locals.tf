locals {
  nginx_ingress_namespace = var.nginx_ingress_namespace_external != "" ? var.nginx_ingress_namespace : kubernetes_namespace.ingress-nginx.0.metadata[0].name
}