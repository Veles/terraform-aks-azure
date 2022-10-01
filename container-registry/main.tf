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
  sku                 = var.sku_registry
  admin_enabled       = true
}

resource "azurerm_resource_group" "kube" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_virtual_network" "appvnet" {
  address_space       = var.vnetcidr
  location            = var.location
  name                = "${var.prefix}-appvnet"
  resource_group_name = azurerm_resource_group.kube.name
}

resource "azurerm_subnet" "appsubnet" {
  name                 = lookup(element(var.subnet_prefix, count.index), "name")
  count                = length(var.subnet_prefix)
  resource_group_name  = azurerm_resource_group.kube.name
  virtual_network_name = azurerm_virtual_network.appvnet.name
  address_prefixes     = lookup(element(var.subnet_prefix, count.index), "ip")
}

resource "azurerm_kubernetes_cluster" "kube" {
  name                            = "${var.prefix}-k8s"
  location                        = azurerm_resource_group.kube.location
  resource_group_name             = azurerm_resource_group.kube.name
  dns_prefix                      = "${var.prefix}-k8s"
  kubernetes_version              = var.kubernetes_version
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  default_node_pool {
    node_count     = var.node_count
    name           = "default"
    vm_size        = var.sku
    vnet_subnet_id = azurerm_subnet.appsubnet[0].id
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"

  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = var.environment
  }

  depends_on = [
    azurerm_resource_group.kube,
    azurerm_virtual_network.appvnet
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "name" {
  name                  = "userapplayer"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.kube.id
  node_count            = var.node_count
  vm_size               = var.sku
  vnet_subnet_id        = azurerm_subnet.appsubnet[1].id
  max_pods              = var.max_pods
  mode                  = "User"
  enable_auto_scaling   = true
  min_count             = var.min_count
  max_count             = var.max_count

  tags = {
    Environment = var.environment
  }

  depends_on = [
    azurerm_kubernetes_cluster.kube,
    azurerm_virtual_network.appvnet
  ]
}


resource "azurerm_role_assignment" "kube" {
  principal_id                     = azurerm_kubernetes_cluster.kube.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}