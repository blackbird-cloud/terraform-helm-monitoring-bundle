variable "grafana_disk_size" {
  type        = string
  default     = "5Gi"
  description = "Persistent disk size for grafana"
}

variable "prometheus_disk_size" {
  type        = string
  default     = "8Gi"
  description = "Persistent disk size for prometheus"
}

variable "prometheus_retention_period" {
  type        = string
  default     = "30d"
  description = "Retention period of prometheus metrics"
}

variable "prometheus_node_exporter_tolerations" {
  type        = list(map(any))
  description = "Prometheus node exporter tolerations list"
}

variable "alert_manager_disk_size" {
  type        = string
  default     = "5Gi"
  description = "Persistent disk size for alert manager"
}

variable "grafana_ingress_host" {
  type        = string
  description = "Ingress host name for grafana"
}

variable "grafana_ingress_class" {
  type        = string
  description = "Ingress class name for grafana"
}

variable "grafana_ingress_extra_annotations" {
  type        = map(string)
  default     = {}
  description = "Extra annotations for grafana ingress"
}

variable "grafana_ingress_overrides" {
  type        = map(any)
  default     = {}
  description = "Ingress config block overrides for grafana"
}

variable "storage_class_name" {
  type        = string
  description = "K8S Storage Class name for persistence"
}

variable "grafana_service_account_create" {
  type        = bool
  default     = false
  description = "Create service account for grafana to use"
}

variable "grafana_service_account_annotations" {
  type        = map(any)
  default     = {}
  description = "Service account annotations for grafana"
}

variable "prometheus_values" {
  type        = list(string)
  description = "A list of extra values to pass into the Prometheus helm chart."
  default     = []
}

variable "grafana_values" {
  type        = list(string)
  description = "A list of extra values to pass into the Grafana helm chart."
  default     = []
}
