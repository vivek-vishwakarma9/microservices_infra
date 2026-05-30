output "clusters" {
  description = "The created AKS objects."
  value       = azurerm_kubernetes_cluster.this
}

output "kube_configs" {
  description = "Map of kube_configs for the clusters."
  value       = { for k, v in azurerm_kubernetes_cluster.this : k => v.kube_config_raw }
  sensitive   = true
}
