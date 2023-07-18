# terraform-helm-nginx-ingress

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.10.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.nginx-ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.ingress-nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm_nginx_force_update"></a> [helm\_nginx\_force\_update](#input\_helm\_nginx\_force\_update) | helm chart deploy with force option | `bool` | `false` | no |
| <a name="input_helm_repos"></a> [helm\_repos](#input\_helm\_repos) | n/a | `map(string)` | <pre>{<br>  "ingress-nginx": "https://kubernetes.github.io/ingress-nginx"<br>}</pre> | no |
| <a name="input_nginx_ingress_allow_prometheus"></a> [nginx\_ingress\_allow\_prometheus](#input\_nginx\_ingress\_allow\_prometheus) | n/a | `bool` | `false` | no |
| <a name="input_nginx_ingress_chart_version"></a> [nginx\_ingress\_chart\_version](#input\_nginx\_ingress\_chart\_version) | n/a | `string` | `"4.7.1"` | no |
| <a name="input_nginx_ingress_class_name"></a> [nginx\_ingress\_class\_name](#input\_nginx\_ingress\_class\_name) | n/a | `string` | `null` | no |
| <a name="input_nginx_ingress_deploy_on_preemptible"></a> [nginx\_ingress\_deploy\_on\_preemptible](#input\_nginx\_ingress\_deploy\_on\_preemptible) | Allow nginx-ingress deployed on GKE preemtible nodes | `bool` | `false` | no |
| <a name="input_nginx_ingress_helm_release_name"></a> [nginx\_ingress\_helm\_release\_name](#input\_nginx\_ingress\_helm\_release\_name) | n/a | `string` | `"nginx-ingress"` | no |
| <a name="input_nginx_ingress_hpa_enabled"></a> [nginx\_ingress\_hpa\_enabled](#input\_nginx\_ingress\_hpa\_enabled) | enable hpa autoscaller | `bool` | `true` | no |
| <a name="input_nginx_ingress_lbl_internal_enabled"></a> [nginx\_ingress\_lbl\_internal\_enabled](#input\_nginx\_ingress\_lbl\_internal\_enabled) | Deploy nginx\_ingress internal for GCP, instead of public, if 'true', no public lbl will be deployed | `bool` | `false` | no |
| <a name="input_nginx_ingress_namespace"></a> [nginx\_ingress\_namespace](#input\_nginx\_ingress\_namespace) | n/a | `string` | `"nginx-ingress"` | no |
| <a name="input_nginx_ingress_namespace_external"></a> [nginx\_ingress\_namespace\_external](#input\_nginx\_ingress\_namespace\_external) | nginx ingress namespace externaly supplied | `string` | `null` | no |
| <a name="input_nginx_ingress_replica_count"></a> [nginx\_ingress\_replica\_count](#input\_nginx\_ingress\_replica\_count) | n/a | `number` | `2` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
