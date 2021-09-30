resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = var.nginx_ingress_namespace
    labels = {
      "name" = var.nginx_ingress_namespace
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
  force_update  = false
  recreate_pods = true
  namespace     = kubernetes_namespace.ingress-nginx.metadata.0.name
  values = [
    data.template_file.values.rendered
  ]
}


data "template_file" "values" {
  template = file("${path.module}/values/nginx-ingress.yaml.tpl")
  vars = {
    nginx_ingess_hpa_enabled      = var.nginx_ingess_hpa_enabled
    nginx_ingess_replica_count    = var.nginx_ingess_replica_count
    nginx_ingess_deploy_on_preemptible = var.nginx_ingess_deploy_on_preemptible
  }
}