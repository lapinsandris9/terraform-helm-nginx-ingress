---
controller:
  service:
    internal:
      enabled: ${nginx_ingress_deploy_internal_loadbalancer}
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-scheme: "internal"
