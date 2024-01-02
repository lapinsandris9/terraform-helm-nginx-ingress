
variable "helm_repos" {
  type = map(string)
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
  default     = true
  type        = bool
  description = "enable hpa autoscaller"
}

variable "nginx_ingress_allow_prometheus" {
  default = false
}

variable "helm_nginx_force_update" {
  default     = false
  type        = bool
  description = "helm chart deploy with force option"
}

variable "nginx_ingress_namespace_external" {
  default     = null
  description = "nginx ingress namespace externaly supplied"
  type        = string
}

variable "nginx_ingress_lbl_internal_enabled" {
  default     = false
  description = "Deploy nginx_ingress internal for GCP, instead of public, if 'true', no public lbl will be deployed"
}

variable "nginx_ingress_class_name" {
  default = null
  type    = string
}

variable "gcp_internal_subnet_name" {
  default     = null
  description = "vpc subnet name if nginx_ingress_lbl_internal_enabled='true'"
}

variable "nginx_ingress_deploy_on" {
  default     = "standard"
  type        = string
  description = "Nodes selector for nginx_ingress in GKE"
}
