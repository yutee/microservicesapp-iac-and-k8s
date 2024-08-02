resource "random_integer" "number" {
  min = 10
  max = 99 
}

resource "azurerm_resource_group" "rg" {
  name     = "capstone-${random_integer.number.id}-RG"
  location = "eastus"

  tags = {
    environment = "Capstone"
  }
}