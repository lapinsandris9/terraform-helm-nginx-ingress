
variable "helm_repos" {
  type    = map(string)
  default = {
    ingress-nginx = "https://kubernetes.github.io/ingress-nginx"
  }
}

variable "nginx_ingress_namespace" {
  default = "nginx-ingress"
  type    = string
}

variable "nginx_ingress_helm_release_name" {
  default = "nginx-ingress"
  type    = string
}

variable "nginx_ingress_chart_version" {
  default = "4.7.1"
  type    = string
}

variable "nginx_ingress_replica_count" {
  default = 2
}

variable "nginx_ingress_hpa_enabled" {
  default = true
  b
}

variable "nginx_ingress_deploy_on_preemptible" {
  default = false
  type = bool
  description = "Allow nginx-ingress deployed on GKE preemtible nodes"
}

variable "nginx_ingress_allow_prometheus" {
  default = false
}

variable "helm_nginx_force_update" {
  default = false
  type = bool
  description = "helm chart deploy with force option"
}

variable "nginx_ingress_namespace_external" {
  default = null
  description = "nginx ingress namespace externaly supplied"
  type = string
}

variable "nginx_ingress_deploy_internal_loadbalancer" {
  default = false
  description = "Deploy nginx_ingress internal for GCP, instead of public, if 'true', no public lbl will be deployed"
}