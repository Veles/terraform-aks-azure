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
   subscription_id = var.ARM_SUBSCRIPTION_ID
   tenant_id       = var.ARM_TENANT_ID
}

provider "azuread" {
  tenant_id = var.tenant_id
}