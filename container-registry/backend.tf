terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate5037"
    container_name       = "tfstate"
    key                  = "8cWw+/iTYfl/HybOqb2m4D+gTIMMiCLiP3cftEUIApJV90pq2znsFnczqRHNIXDJ5d53CzmqXhsP+AStI3QVYQ=="
  }
  required_providers {
    azurerm = {
      version = "= 3.25.0"
      source  = "hashicorp/azurerm"
    }
    azuread = {
      version = "2.29.0"
      source  = "hashicorp/azuread"
    }
  }
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "subscription_id" {
  type      = string
  sensitive = true
}
variable "client_id" {
  type      = string
  sensitive = true
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "723f9d92-2b27-4228-9238-abac464e81cd"
  tenant_id       = "176af66e-3d60-4d7b-8af4-550dc1364cd7"
  client_id       = "67af739c-2635-4265-9822-aeb7d847dfbd"
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
  config_path = var.kube_config
}
resource "kubernetes_namespace" "test" {
  metadata {
    name = "nginx"
  }
}