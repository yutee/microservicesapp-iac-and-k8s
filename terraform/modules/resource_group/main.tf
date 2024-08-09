resource "random_integer" "number" {
  min = 1000
  max = 9999 
}

resource "azurerm_resource_group" "rg" {
  name     = "capstone-${random_integer.number.id}-RG"
  location = "East US 2"

  tags = {
    environment = "Capstone"
  }
}