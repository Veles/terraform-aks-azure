terraform {
  /*   backend "azurerm" {
    resource_group_name   = "dev-storages"
    storage_account_name  = "tfstatesfordev"
    container_name        = "tfstates"
    key                   = "acr-dev.terraform.tfstate"
  } */
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
  type = string
  sensitive = true
}

variable "subscription_id" {
  type = string
  sensitive = true
}
variable "client_id" {
  type = string
  sensitive = true
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "723f9d92-2b27-4228-9238-abac464e81cd"
  tenant_id       = "176af66e-3d60-4d7b-8af4-550dc1364cd7"
  client_id       = "67af739c-2635-4265-9822-aeb7d847dfbd"
}