terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Backend for storing state in management subscription
  backend "azurerm" {
    resource_group_name  = "rg-management"
    storage_account_name = "stmgmtstate"
    container_name       = "tfstate"
    key                  = "development/terraform.tfstate"
    subscription_id      = "519106f4-cfa7-4c39-a811-2c6688b430cf" 
  }
}

# Provider for managing resources in development subscription
provider "azurerm" {
  features {}
  
  subscription_id = var.development_subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-aks"
  location = "East US"
}


