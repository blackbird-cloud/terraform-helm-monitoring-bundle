resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "kube-system"

  values = [
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
      }
    })
  ]

  cleanup_on_fail = true
  version         = "15.5.3"
  force_update    = true
}
