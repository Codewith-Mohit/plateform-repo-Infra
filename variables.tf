variable "location"{
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

variable "vnet-name" {
    description = "The name of the virtual network."
    type        = string
    default     = "vnet-project-infra"
}

variable "subnet-name" {
    description = "The name of the subnet."
    type        = string
    default     = "snet-project-infra"
}

variable "storage-account-name" {
    description = "The name of the storage account."
    type        = string
    default     = "strg-project-infra"
}

variable "container-name" {
    description = "The name of the container."
    type        = string
    default     = "cntr-project-infra"
}

variable "aks-cluster-name" {
    description = "The name of the AKS cluster."
    type        = string
    default     = "aks-project-infra"
}

variable "acr-name" {
    description = "The name of the Azure Container Registry."
    type        = string
    default     = "acrprojectinfra"
}