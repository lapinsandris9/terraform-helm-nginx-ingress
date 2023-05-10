
variable "helm_repos" {
  type    = map(string)
  default = {
    ingress-nginx = "https://kubernetes.github.io/ingress-nginx"
  }
}

variable "nginx_ingress_namespace" {
  default = "nginx-ingress"
}

variable "nginx_ingress_helm_release_name" {
  default = "nginx-ingress"
}

variable "nginx_ingress_chart_version" {
  default = "4.6.1"
}

variable "nginx_ingess_replica_count" {
  default = 2
}

variable "nginx_ingess_hpa_enabled" {
  default = false
}

variable "nginx_ingess_deploy_on_preemptible" {
  default = false
}

variable "nginx_ingess_allow_prometheus" {
  default = false
}
