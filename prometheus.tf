resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "kube-system"
  version    = "15.5.3"

  values = concat([
    yamlencode({
      alertmanager : {
        persistentVolume : {
          size : var.alert_manager_disk_size
          storageClass : var.storage_class_name
        }
      }
      server : {
        retention : var.prometheus_retention_period
        persistentVolume : {
          size : var.prometheus_disk_size
          storageClass : var.storage_class_name
        }
      },
      nodeExporter : {
        tolerations : var.prometheus_node_exporter_tolerations
      }
    })
  ], var.prometheus_values)

  cleanup_on_fail = true
  force_update    = true
}
