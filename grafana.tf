resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "kube-system"

  values = concat([
    yamlencode({
      rbac : {
        create : true
      },
      serviceAccount : {
        create : var.grafana_service_account_create
        annotations : var.grafana_service_account_annotations
      },
      persistence : {
        enabled : true,
        storageClassName : var.storage_class_name,
        size : var.grafana_disk_size
      },
      ingress : merge({
        enabled : true,
        annotations : merge({
          "kubernetes.io/ingress.class" : var.grafana_ingress_class
        }, var.grafana_ingress_extra_annotations),
        hosts : [var.grafana_ingress_host],
        tls : [
          {
            hosts : [var.grafana_ingress_host],
            secretName : var.grafana_ingress_host
          }
        ]
      }, var.grafana_ingress_overrides),
      "grafana.ini" : {
        server : {
          root_url : "https://${var.grafana_ingress_host}"
        }
      }
    })
  ], var.grafana_values)

  cleanup_on_fail = true
  version         = "6.26.1"
  force_update    = true
}
