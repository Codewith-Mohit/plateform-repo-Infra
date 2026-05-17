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
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Basic"
  admin_enabled       = false
  tags                = local.common_tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.aks_cluster_name}-dns"

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = var.aks_node_vm_size

    upgrade_settings {
      max_surge = 1
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  linux_profile {
    admin_username = var.aks_admin_username

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  tags = local.common_tags
}


