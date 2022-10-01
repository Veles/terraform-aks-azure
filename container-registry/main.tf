# ACR creation based on https://www.terraform.io/docs/providers/azurerm/r/container_registry.html
data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.registryname
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.sku
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "kube" {
  name                = "example-kube"
  location            = azurerm_resource_group.kube.location
  resource_group_name = azurerm_resource_group.kube.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_role_assignment" "kube" {
  principal_id                     = azurerm_kubernetes_cluster.kune.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}