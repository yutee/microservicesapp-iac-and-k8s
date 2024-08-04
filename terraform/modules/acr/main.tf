resource "azurerm_container_registry" "acr" {
  name                = "capstonesregistry43"
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku                 = "Basic"
  admin_enabled       = true

  public_network_access_enabled = true
}
