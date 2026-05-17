terraform {
  required_version = ">= 1.5.0"

    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 3.0"
        }
    }

      # Uncomment and configure when ready to use remote state
   backend "azurerm" {
     resource_group_name  = "rg-terraform-state"
     storage_account_name = "stterraformstate"
     container_name       = "tfstate"
     key                  = "management/terraform.tfstate"
   }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-aks"
  location = "East US"
}


