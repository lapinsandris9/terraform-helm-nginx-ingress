locals {
  nginx_ingress_namespace = var.nginx_ingress_namespace_external != "" ? var.nginx_ingress_namespace : kubernetes_namespace.ingress-nginx.metadata[0].name
}