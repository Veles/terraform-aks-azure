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

provider "azurerm" {
  features {
  }
}
