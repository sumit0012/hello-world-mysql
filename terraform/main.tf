provider "azurerm" {
  features {}
  subscription_id = "c7c0c81d-79ac-49eb-8aa0-c9f16e51cca1"
}

resource "azurerm_resource_group" "rg" {
  name     = "aks-resource-group"
  location = "Central India"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  private_cluster_enabled = true
  identity {
    type = "SystemAssigned"
  }
}
