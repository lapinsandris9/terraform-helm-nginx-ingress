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
  count         = var.nginx_ingress_deploy_internal_loadbalancer ? 0 : 1
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
        nginx_ingress_hpa_enabled           = var.nginx_ingress_hpa_enabled
        nginx_ingress_replica_count         = var.nginx_ingress_replica_count
        nginx_ingress_deploy_on_preemptible = var.nginx_ingress_deploy_on_preemptible
        nginx_ingress_allow_prometheus      = var.nginx_ingress_allow_prometheus
        nginx_ingress_class_name            = var.nginx_ingress_class_name
      }
    )
  ]
}

resource "helm_release" "nginx-ingress-internal" {
  count         = var.nginx_ingress_deploy_internal_loadbalancer ? 1 : 0
  name          = "${var.nginx_ingress_helm_release_name}-internal"
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
        nginx_ingress_class_name            = var.nginx_ingress_internal_class_name
        nginx_ingress_hpa_enabled           = var.nginx_ingress_hpa_enabled
        nginx_ingress_replica_count         = var.nginx_ingress_replica_count
        nginx_ingress_deploy_on_preemptible = var.nginx_ingress_deploy_on_preemptible
        nginx_ingress_allow_prometheus      = var.nginx_ingress_allow_prometheus
      }
    ),
    templatefile("${path.module}/values/nginx_ingress_internal.yaml.tpl",
      {
        nginx_ingress_deploy_internal_loadbalancer = var.nginx_ingress_deploy_internal_loadbalancer
      }
    ),
  ]
}