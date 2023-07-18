resource "kubernetes_namespace" "ingress-nginx" {
  count = var.nginx_ingress_namespace_external != "" ? 0 : 1
  metadata {
    name = var.nginx_ingress_namespace
    labels = {
      "name"                         = var.nginx_ingress_namespace
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

resource "helm_release" "nginx-ingress" {
  name          = var.nginx_ingress_helm_release_name
  repository    = var.helm_repos.ingress-nginx
  chart         = "ingress-nginx"
  version       = var.nginx_ingress_chart_version
  wait          = true
  force_update  = var.helm_nginx_force_update
  recreate_pods = true
  namespace     = local.nginx_ingress_namespace
  values = [
    templatefile("${path.module}/values/nginx_ingress.yaml.tpl",
      {
        nginx_ingress_lbl_internal_enabled  = var.nginx_ingress_lbl_internal_enabled
        nginx_ingress_hpa_enabled           = var.nginx_ingress_hpa_enabled
        nginx_ingress_replica_count         = var.nginx_ingress_replica_count
        nginx_ingress_deploy_on_preemptible = var.nginx_ingress_deploy_on_preemptible
        nginx_ingress_allow_prometheus      = var.nginx_ingress_allow_prometheus
        nginx_ingress_class_name            = local.nginx_ingress_class_name_substrate
        nginx_ingress_lbl_external_enabled  = local.nginx_ingress_lbl_external_enabled
        gcp_internal_subnet_name            = var.gcp_internal_subnet_name
      }
    )
  ]
}
