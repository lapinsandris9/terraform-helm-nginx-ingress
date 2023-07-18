---
controller:
  service:
    internal:
      enabled: ${nginx_ingress_deploy_internal_loadbalancer}
      annotations:
        networking.gke.io/load-balancer-type: "Internal"
