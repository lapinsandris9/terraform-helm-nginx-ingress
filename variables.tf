
variable "helm_repos" {
  type    = map(string)
  default = {
    nginx-ingress = "https://helm.nginx.com/stable"
    ingress-nginx = "https://kubernetes.github.io/ingress-nginx"
  }
}

variable "nginx_ingress_chart_version" {
  default = "3.21.0"
}

variable "nginx_ingress_namespace" {
  default = "nginx-ingress"
}

variable "nginx_ingress_helm_release_name" {
  default = "nginx-ingress"
}