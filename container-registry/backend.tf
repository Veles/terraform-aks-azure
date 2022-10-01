terraform {
  /*   backend "azurerm" {
    resource_group_name   = "dev-storages"
    storage_account_name  = "tfstatesfordev"
    container_name        = "tfstates"
    key                   = "acr-dev.terraform.tfstate"
  } */
  required_providers {
    azurerm = {
      version = "~> 2.99.0"
      source  = "hashicorp/azurerm"
    }
    azuread = {
      version = "2.23.0"
      source  = "hashicorp/azuread"
    }
  }
}

provider "azurerm" {
  features {
  }
   subscription_id = "723f9d92-2b27-4228-9238-abac464e81cd"
   tenant_id       = "176af66e-3d60-4d7b-8af4-550dc1364cd7"
}

provider "azuread" {
  tenant_id = var.tenant_id
}