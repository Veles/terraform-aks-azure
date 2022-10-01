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

variable "sku_registry" {
  description = "The SKU of the Azure Container Registry"
  default     = "Basic"
}
variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used"
}




variable "prefix" {
  description = "A prefix used for all resources"
  default = "dev"
}

variable "sku" {
  description = "The SKU of the AKS nodes"
  default     = "Standard_B2s"
}

variable "environment" {
  description = "The Environment of the AKS cluster"
  default     = "dev"
}

variable "vnetcidr" {
  description = "The CIDR of the VNet to use for the AKS cluster"
  default     = ["192.168.0.0/22"]
}

variable "subnet_prefix" {
  type = list(any)
  default = [
    {
      ip   = ["192.168.0.0/24"]
      name = "subnet-1-system"
    },
    {
      ip   = ["192.168.1.0/24"]
      name = "subnet-2-apps"
    }
  ]
}

variable "node_count" {
  description = "The number of nodes to use for the AKS cluster"
  default     = 1
}

variable "max_pods" {
  description = "The maximum number of pods that can be run on a node"
  default     = 250
}

variable "min_count" {
  description = "The minimum number of nodes to use for the AKS cluster (autoscaling)"
  default     = 1
}

variable "max_count" {
  description = "The maximum number of nodes to use for the AKS cluster (autoscaling)"
  default     = 2
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster"
  default     = "1.23.5"
}

variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges that can access the K8s API server"
  default     = ["0.0.0.0/32"]
}