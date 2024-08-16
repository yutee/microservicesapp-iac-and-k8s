resource "azurerm_network_security_group" "nsg" {
  name                = "capstone-${var.random_integer}-NSG"
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "capstone-${var.random_integer}-VNET"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["11.0.0.0/16"]
  dns_servers         = ["11.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Capstone"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["11.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["11.0.2.0/24"]
}

# adding firewall

resource "azurerm_firewall_policy" "azfw_policy" {
  name                = "firewall-policy"
  resource_group_name = var.rg_name
  location            = var.rg_location
}

resource "azurerm_firewall_policy_rule_collection_group" "restrict_traffic_rule" {
  name               = "RestrictTrafficRuleGroup"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 200
  
  network_rule_collection {
    name     = "AllowSpecificIP"
    action   = "Allow"
    priority = 200

    rule {
      name                  = "allow-traffic-from-specific-ip"
      protocols             = ["TCP"]
      source_addresses      = ["105.113.12.228"] # Can also be an ip range for all that to be allowed
      destination_ports     = ["80"]
      destination_addresses = ["20.122.213.250"]
    }
  }
}

resource "azurerm_firewall" "az_firewall" {
  name                = "az_firewall"
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku_name            = "AZFW_Hub"
  sku_tier            = "Standard"
  firewall_policy_id  = azurerm_firewall_policy.azfw_policy.id
}
