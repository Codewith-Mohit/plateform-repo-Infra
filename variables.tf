variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "westeurope"
}

variable "development_subscription_id" {
  description = "The Azure subscription ID for the development environment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "rg-development"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet-project-infra"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "snet-project-infra"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "aks-project-infra"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
  default     = "acrprojectinfra"
}

variable "aks_admin_username" {
  description = "Linux admin username for AKS nodes."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for AKS node access. Set this in terraform.tfvars or via environment variables."
  type        = string
  sensitive   = true
  default     = ""
}