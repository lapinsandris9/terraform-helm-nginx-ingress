controller:
  metrics:
    enabled: "true"
    serviceMonitor:
      enabled: "true"
      additionalLabels:
        release: "kube-prometheus-stack"
  autoscaling:
    enabled: "${nginx_ingess_hpa_enabled}"
  replicaCount: ${nginx_ingess_replica_count}
  enableCustomResources: "false"
  nodeSelector:
    kubernetes.io/os: linux
    cloud.google.com/gke-preemptible: "${nginx_ingess_deploy_on_preemptible}"
  appprotect:
    enable: "false"
  stats:
    enabled: "true"
  service:
    enableHttp: "false"
    externalTrafficPolicy: "Local"
    annotations:
  config:
    enable-vts-status: "false"
    use-forwarded-headers: "true"
    log-format-escape-json: "true"
    log-format-upstream: '{ "time_iso": "$time_iso8601","server_host": "$host","server_port": "$server_port","server_pid": "$pid","client_addr": "$remote_addr","http_request_method": "$request_method","http_request_uri": "$request_uri","http_request_uri_normalized": "$uri","http_request_args": "$args","http_request_protocol": "$server_protocol","http_request_length": "$request_length","http_request_time": "$request_time","http_response_size": "$bytes_sent","http_response_body_size": "$body_bytes_sent","http_content_length": "$content_length","http_content_type": "$content_type","upstream_server": "$upstream_addr","upstream_connect_time": "$upstream_connect_time","upstream_header_time": "$upstream_header_time","upstream_response_time": "$upstream_response_time","upstream_response_length": "$upstream_response_length","upstream_status": "$upstream_status","http_status": "$status","http_referer": "$http_referer","http_user_agent": "$http_user_agent", "cf_country": "$http_cf_ipcountry", "cf_ray_id": "$http_cf_ray", "http_cookie": "$http_cookie" }'