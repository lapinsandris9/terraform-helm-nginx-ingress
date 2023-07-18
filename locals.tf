locals {
  nginx_ingress_lbl_external_enabled = var.nginx_ingress_lbl_internal_enabled ? false : true
  nginx_ingress_class_name_substrate = var.nginx_ingress_class_name != null ? var.nginx_ingress_class_name : (var.nginx_ingress_lbl_internal_enabled ? "nginx-internal" : "nginx")
  nginx_ingress_namespace            = var.nginx_ingress_namespace_external != "" ? var.nginx_ingress_namespace : kubernetes_namespace.ingress-nginx.0.metadata[0].name
}