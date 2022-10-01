output "registry_endpoint" {
  value = azurerm_container_registry.acr.login_server
}

output "admin_username" {
  value     = azurerm_container_registry.acr.admin_username
  sensitive = true
}

output "admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "id" {
  value = azurerm_kubernetes_cluster.kube.id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.kube.kube_config_raw
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.kube.kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.kube.kube_config.0.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.kube.kube_config.0.cluster_ca_certificate
}

output "host" {
  value = azurerm_kubernetes_cluster.kube.kube_config.0.host
}