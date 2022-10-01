variable "rgname" {
  description = "Resource Group name for Azure Container Registry resources"
  default     = "acrdevtest"
}

variable "location" {
  description = "The Azure Region in which all resources should be provisioned for ACR"
  default     = "West Europe"
}

variable "registryname" {
  description = "Azure Container Registry name"
  default     = "acrdevtest88registry"
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  default     = "Basic"
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "SUBSCRIPTION ID for Azure AD"
}
variable "ARM_TENANT_ID" {
  description = "Tenant ID for Azure AD"
}
variable "subscription_id" {
  description = "SUBSCRIPTION ID for Azure AD"
}
variable "tenant_id" {
  description = "Tenant ID for Azure AD"
}
