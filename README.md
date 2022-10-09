## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.grafana](https://registry.terraform.io/providers/hashicorp/helm/2.7.0/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/2.7.0/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_manager_disk_size"></a> [alert\_manager\_disk\_size](#input\_alert\_manager\_disk\_size) | Persistent disk size for alert manager | `string` | `"5Gi"` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | Cluster issuer name for certificate | `string` | `"letsencrypt"` | no |
| <a name="input_grafana_disk_size"></a> [grafana\_disk\_size](#input\_grafana\_disk\_size) | Persistent disk size for grafana | `string` | `"5Gi"` | no |
| <a name="input_grafana_ingress_class"></a> [grafana\_ingress\_class](#input\_grafana\_ingress\_class) | Ingress class name for grafana | `string` | n/a | yes |
| <a name="input_grafana_ingress_extra_annotations"></a> [grafana\_ingress\_extra\_annotations](#input\_grafana\_ingress\_extra\_annotations) | Extra annotations for grafana ingress | `map(string)` | `{}` | no |
| <a name="input_grafana_ingress_host"></a> [grafana\_ingress\_host](#input\_grafana\_ingress\_host) | Ingress host name for grafana | `string` | n/a | yes |
| <a name="input_grafana_ingress_overrides"></a> [grafana\_ingress\_overrides](#input\_grafana\_ingress\_overrides) | Ingress config block overrides for grafana | `map(any)` | `{}` | no |
| <a name="input_prometheus_disk_size"></a> [prometheus\_disk\_size](#input\_prometheus\_disk\_size) | Persistent disk size for prometheus | `string` | `"8Gi"` | no |
| <a name="input_prometheus_retention_period"></a> [prometheus\_retention\_period](#input\_prometheus\_retention\_period) | Retention period of prometheus metrics | `string` | `"30d"` | no |
| <a name="input_ssl_redirect_frontend_config"></a> [ssl\_redirect\_frontend\_config](#input\_ssl\_redirect\_frontend\_config) | SSL Redirect FrontendConfig name | `string` | `"ssl-redirect"` | no |
| <a name="input_storage_class_name"></a> [storage\_class\_name](#input\_storage\_class\_name) | K8S Storage Class name for persistence | `string` | n/a | yes |

## Outputs

No outputs.
