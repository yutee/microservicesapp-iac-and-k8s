# create a random random_number

resource "random_integer" "number" {
  min = 10
  max = 99 
}

# resource group

resource "azurerm_container_registry" "acr" {
  name                = "capstonesregistry"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true

  public_network_access_enabled = true
}

resource "azurerm_resource_group" "rg" {
  name     = "capstone-${random_integer.number.id}-RG"
  location = "West US 2"

  tags = {
    environment = "Capstone"
  }
}

# virtual network

resource "azurerm_network_security_group" "nsg" {
  name                = "capstone-${random_integer.number.id}-NSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "capstone-${random_integer.number.id}-VNET"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  tags = {
    environment = "Capstone"
  }
}

# azure kubernetes cluster

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${random_integer.number.id}-AKS"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${random_integer.number.id}-k8s"
  kubernetes_version  = "1.28.10"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Capstone"
  }
}
