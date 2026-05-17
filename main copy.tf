terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

   backend "azurerm" {
     resource_group_name  = "rg-management"
     storage_account_name = "stmgmtstate"
     container_name       = "tfstate"
     key                  = "management/terraform.tfstate"
   }
}

# Resource Group
resource "azurerm_resource_group" "development" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}